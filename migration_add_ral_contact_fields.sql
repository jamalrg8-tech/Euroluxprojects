-- ============================================================================
-- Eurolux Project & Procurement Management System
-- Migration: Approved RAL Color + Site Contact fields
-- ============================================================================
-- Run this once in Supabase: Dashboard > SQL Editor > New query > paste > Run.
-- Safe to re-run (uses IF NOT EXISTS).
--
-- Adds:
--   projects.approved_ral_color  -- e.g. "RAL 9016M"
--   projects.contact_name        -- site contact name
--   projects.contact_phone       -- site contact phone
--
-- Note: "Design Approved Date" reuses the existing projects.design_signoff_date
-- column (already in your database, just newly exposed in the app) — no new
-- column needed for that one.
-- ============================================================================

alter table public.projects add column if not exists approved_ral_color text;
alter table public.projects add column if not exists contact_name text;
alter table public.projects add column if not exists contact_phone text;
