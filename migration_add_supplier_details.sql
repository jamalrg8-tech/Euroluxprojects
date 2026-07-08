-- ============================================================================
-- Eurolux Project & Procurement Management System
-- Migration: Full supplier directory (phone, email, address, products)
-- ============================================================================
-- Run this once in Supabase: Dashboard > SQL Editor > New query > paste > Run.
-- Safe to re-run (uses IF NOT EXISTS).
--
-- Adds to public.suppliers:
--   phone               text
--   email               text
--   address             text
--   products_supplied   text   -- free text list of what they supply
--
-- The existing "contact" column is kept as-is (it already holds the contact
-- person's name for suppliers where you filled it in).
--
-- Note: any phone numbers you previously typed into a supplier's Notes field
-- are NOT moved automatically — free text in Notes isn't reliable to parse
-- programmatically. Please open each supplier under Reference Data > Suppliers
-- and copy the phone number across into the new Phone field (quick one-time
-- cleanup). Going forward, phone/email/address/products all have their own
-- dedicated fields.
-- ============================================================================

alter table public.suppliers add column if not exists phone text;
alter table public.suppliers add column if not exists email text;
alter table public.suppliers add column if not exists address text;
alter table public.suppliers add column if not exists products_supplied text;
