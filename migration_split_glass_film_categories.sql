-- ============================================================================
-- Eurolux Project & Procurement Management System
-- Migration: Split "Glass & Film" category, add film sub-categories
-- ============================================================================
-- Run this once in Supabase: Dashboard > SQL Editor > New query > paste > Run.
-- Safe to re-run.
--
-- What this does:
--   1. Renames your existing "Glass & Film" category to "Glass". This keeps
--      every procurement item currently tagged "Glass & Film" correctly
--      linked (they'll now show under "Glass") — nothing gets lost.
--   2. Adds four new categories: "Film", "SSF Film", "Tinted Film",
--      "Frosted Film".
--
-- After running, go through your existing items that are actually film (not
-- glass) and re-assign them from "Glass" to the correct new Film category
-- using the item's Edit form — the app can't tell which of your existing
-- "Glass & Film" items were film vs. glass, so that reassignment is manual.
-- ============================================================================

update public.categories set name = 'Glass', sort_order = 4 where name = 'Glass & Film';

insert into public.categories (name, sort_order) values
  ('Film', 5),
  ('SSF Film', 6),
  ('Tinted Film', 7),
  ('Frosted Film', 8)
on conflict (name) do nothing;

-- Keep the remaining categories ordered sensibly after the new ones
update public.categories set sort_order = 9 where name = 'Insect Screens';
update public.categories set sort_order = 10 where name = 'Railings & Other';
