-- ============================================================================
-- Eurolux Project & Procurement Management System
-- Supabase (Postgres) schema — Phase 1
-- ============================================================================
-- Run this once in Supabase: Dashboard > SQL Editor > New query > paste > Run.
-- Safe to re-run: uses IF NOT EXISTS / CREATE OR REPLACE where possible.
-- ============================================================================

create extension if not exists pgcrypto;

-- ----------------------------------------------------------------------------
-- Reference tables (FR-4.x)
-- ----------------------------------------------------------------------------

create table if not exists public.suppliers (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  contact text,                          -- contact person's name
  phone text,
  email text,
  address text,
  products_supplied text,                -- free text list of products/services supplied
  notes text,
  created_at timestamptz not null default now()
);

create table if not exists public.categories (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.contractors (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  created_at timestamptz not null default now()
);

create table if not exists public.units_of_measure (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  sort_order int not null default 0
);

-- ----------------------------------------------------------------------------
-- Projects (FR-1.x)
-- ----------------------------------------------------------------------------

create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  ref text unique,                       -- project/job number, e.g. P-0001 or EURO-25-014
  site_name text not null,               -- project/site name
  main_contractor text,                  -- free text, autocompletes against contractors table
  client text,
  address_cluster text,                  -- project address / cluster
  unit_ref text,                         -- villa / unit reference
  scope_text text,                       -- free-text scope carried over from legacy sheet / quick notes
  project_value numeric(14,2),           -- overall project value (AED)
  install_date date,                     -- planned installation date
  finish_date date,                      -- target finish date
  status text not null default 'Not Started'
    check (status in ('Not Started','In Progress','On Hold','Delayed / At Risk','Awaiting Material','Completed / Handed Over')),
  notes text,                            -- latest remarks / free text
  -- Additive fields present in the latest tracker (mostly project-level, not yet itemised):
  design_signoff_date date,              -- also shown/edited in the app as "Design Approved Date"
  order_date date,
  requested_delivery_date date,
  primary_supplier text,
  lpo_ref text,
  work_order_no text,
  approved_ral_color text,               -- e.g. "RAL 9016M"
  contact_name text,                     -- site contact name
  contact_phone text,                    -- site contact phone
  is_closed boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_projects_status on public.projects(status);
create index if not exists idx_projects_contractor on public.projects(main_contractor);

-- Timestamped running update log per project (FR-1.3)
create table if not exists public.project_updates (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references public.projects(id) on delete cascade,
  note text not null,
  author text,
  created_at timestamptz not null default now()
);

create index if not exists idx_project_updates_project on public.project_updates(project_id);

-- ----------------------------------------------------------------------------
-- Procurement items (FR-2.x) — core of the system
-- ----------------------------------------------------------------------------

create table if not exists public.items (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references public.projects(id) on delete cascade,
  category_id uuid references public.categories(id) on delete set null,
  description text not null,
  qty numeric(12,2) not null default 1,
  uom text,                              -- unit of measure
  supplier_id uuid references public.suppliers(id) on delete set null,
  unit_cost numeric(14,2),
  total_cost numeric(14,2) generated always as (round(coalesce(qty,0) * coalesce(unit_cost,0), 2)) stored,
  purchase_date date,
  lead_time_days int,
  required_delivery date,
  actual_delivery date,
  po_ref text,
  item_status text not null default 'Not Started'
    check (item_status in ('Not Started','Ordered','In Production','Delayed / At Risk','Delivered','Installed')),
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_items_project on public.items(project_id);
create index if not exists idx_items_category on public.items(category_id);
create index if not exists idx_items_supplier on public.items(supplier_id);
create index if not exists idx_items_required_delivery on public.items(required_delivery);

-- ----------------------------------------------------------------------------
-- updated_at triggers
-- ----------------------------------------------------------------------------

create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_projects_updated_at on public.projects;
create trigger trg_projects_updated_at before update on public.projects
  for each row execute function public.set_updated_at();

drop trigger if exists trg_items_updated_at on public.items;
create trigger trg_items_updated_at before update on public.items
  for each row execute function public.set_updated_at();

-- ----------------------------------------------------------------------------
-- Row Level Security
-- ----------------------------------------------------------------------------
-- No login for Phase 1 (per your decision): the app connects with the public
-- anon key, and these policies allow full read/write to anyone with the URL.
-- To lock this down later, add Supabase Auth to the app and replace these
-- with `using (auth.role() = 'authenticated')` policies.

alter table public.suppliers enable row level security;
alter table public.categories enable row level security;
alter table public.contractors enable row level security;
alter table public.units_of_measure enable row level security;
alter table public.projects enable row level security;
alter table public.project_updates enable row level security;
alter table public.items enable row level security;

do $$
declare
  t text;
begin
  for t in select unnest(array['suppliers','categories','contractors','units_of_measure','projects','project_updates','items'])
  loop
    execute format('drop policy if exists "allow_all_%1$s" on public.%1$s;', t);
    execute format('create policy "allow_all_%1$s" on public.%1$s for all using (true) with check (true);', t);
  end loop;
end $$;

-- ----------------------------------------------------------------------------
-- Convenience view: items enriched with project/supplier/category names
-- ----------------------------------------------------------------------------

create or replace view public.v_items as
select
  i.*,
  p.site_name,
  p.main_contractor,
  p.ref as project_ref,
  s.name as supplier_name,
  c.name as category_name
from public.items i
join public.projects p on p.id = i.project_id
left join public.suppliers s on s.id = i.supplier_id
left join public.categories c on c.id = i.category_id;
