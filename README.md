# Eurolux Project & Procurement Management System

A standalone, installable web app (PWA) to plan, track and monitor every
project and the aluminium fenestration items procured and installed against
it — replacing the "Installation plan Status" Excel workbook, per the BRD.

Built as a **single self-contained `index.html`** (plain HTML/CSS/JS, no
build step, no framework) — same architecture as your Eurolux Quotation
System, so both apps are consistent and equally low-maintenance: classic
`<script src="...supabase-js...">` tag, a Setup screen for first-time
Supabase connection, credentials in `localStorage`, and a matching black/white
visual style.

## What's included

```
project-procurement-system/
├── index.html            the whole app (UI + logic, single file)
├── manifest.json          PWA manifest (installable on phone/tablet/PC)
├── service-worker.js       app-shell offline caching
├── icon-192.png / icon-512.png   app icons
├── supabase_setup.sql      run first — creates all tables, view, RLS policies
└── seed.sql                 run second — reference lists + your imported projects
```

## 1. Set up Supabase

1. Go to [supabase.com](https://supabase.com) → create a new project (or use
   an existing one — this app can live in its own project, separate from the
   Quotation System's).
2. **SQL Editor** → New query → paste `supabase_setup.sql` → **Run**.
3. New query again → paste `seed.sql` → **Run**. This loads the reference
   lists (suppliers, categories, contractors, units) and **66 projects
   imported from your latest tracker** (44 active/upcoming from
   "Installation status" + 22 from "Install complete").
4. **Project Settings → API** → copy the **Project URL** and **anon public**
   key. You'll paste these into the app's Setup screen the first time you
   open it (no need to edit any code — unlike the Quotation System, this app
   doesn't have credentials baked in, so it'll show a connection screen on
   first load).

## 2. Push to GitHub

Your repo: **https://github.com/jamalrg8-tech/Euroluxprojects/**

Since this repo already (or will also) hold the Quotation System, put this
app in its own subfolder so the two don't collide:

```bash
# from inside your local clone of Euroluxprojects
mkdir -p project-procurement-system
# copy these files into that folder, then:
git add project-procurement-system
git commit -m "Add Eurolux Project & Procurement Management System"
git push
```

If this is the very first push to that repo, use:

```bash
cd project-procurement-system
git init
git add .
git commit -m "Eurolux Project & Procurement Management System"
git branch -M main
git remote add origin https://github.com/jamalrg8-tech/Euroluxprojects.git
git push -u origin main
```

## 3. Deploy on Vercel

1. [vercel.com](https://vercel.com) → **Add New Project** → import
   `jamalrg8-tech/Euroluxprojects`.
2. Framework preset: **Other** (static files, no build command).
3. Expand **Root Directory** and select `project-procurement-system` (since
   it's a subfolder of the repo).
4. Deploy. You'll get a URL like `euroluxprojects-ppms.vercel.app`.
5. First time you open it, paste your Supabase URL + anon key into the Setup
   screen — it's saved in the browser after that.
6. On your phone: "Add to Home Screen" (iOS Safari) or the install prompt /
   the app's own **⬇ Install** button (Android Chrome / desktop Chrome).

Every future `git push` auto-redeploys — no repeated manual steps. If you
later add the Quotation System to the same repo, give it its own Vercel
project too, pointed at its own subfolder — one GitHub repo can back multiple
Vercel projects this way.

## No login (per your decision)

There's no sign-in screen. The app connects straight to Supabase with the
anon key you enter once, and `supabase_setup.sql` sets permissive Row Level
Security policies so it works immediately. That means anyone with the URL
(and the anon key, which lives in their browser's local storage once they
set it up) can read and write data. If you want to restrict this later,
that means adding Supabase Auth plus a real sign-in gate — a contained
follow-up whenever you're ready.

## Data imported from your latest tracker

- **Projects** were imported from `Installation status` (active + the
  "upcoming projects" section) and `Install complete` — the two sheets that
  match the BRD's one-row-per-site format. The old free-text `Scope` is kept
  on each project under "Scope (legacy notes)".
- Your latest tracker added a few new columns (`Project Value`, `Design sign
  off date`, `Date order`, `Requested delivery date`, `Supplier Name`, `LPO`,
  `Work Order number`). These are mostly blank in the source file so far, but
  I added matching fields to the database and imported the handful of values
  that were filled in (4 projects have a Project Value).
- **Procurement items still start empty.** None of your tracker tabs capture
  item-level supplier/cost/lead-time data — that's the exact gap this system
  fixes. Add items going forward from each project's **+ Add Item** button;
  that's where cost, supplier, quantity and delivery tracking now live, with
  automatic roll-ups per category and per project.
- The other tabs (`WA Tracker`, `WA (Schuco Items)`, `BES...`, `Drawing
  Tracker old`, `SSF ATLANTIS`) are supplier/production working sheets, not
  one-row-per-project trackers, so they weren't imported. I can help pull
  specific data from them into procurement items later if useful.

## What's in the app

- **Dashboard** — KPIs, status breakdown, spend by category/supplier,
  projects needing attention, deliveries/installs due in 14 days.
- **Projects** — searchable/filterable list (status, contractor), CSV
  export, create/edit/delete.
- **Project detail** — full BRD field set, installation progress bar (based
  on items installed, or estimated from status if no items yet), procurement
  items grouped by category with cost roll-ups, timestamped update log,
  print/PDF via the browser's print dialog.
- **Deliveries** — required vs actual delivery dates across all projects,
  overdue items highlighted red, due-soon highlighted amber, filters, CSV
  export.
- **Reports** — spend by project / supplier / category, each exportable to
  CSV, plus total project value vs procurement spend.
- **Reference Data** — manage suppliers, categories, contractors, units of
  measure.

Items are flagged **Overdue** when a required delivery date has passed with
no actual delivery logged, and **Due soon** within 7 days — the FR-2.5
"delayed / at risk" logic from the BRD, computed live in the browser.

I ran the app through an automated browser test (setup/connect flow,
dashboard, project filters, create/edit project, add procurement item with
cost roll-up, updates log, deliveries risk flagging, reports, reference data
CRUD) — all pass.

## Notes

- Currency is AED; dates display as DD/MM/YYYY.
- No build step — you can even open `index.html` directly in a browser to
  poke around the UI, though the Setup screen still needs a real Supabase
  project to actually load/save data.
