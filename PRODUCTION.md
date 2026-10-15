# Production handoff — ZCO EDU NAVIGATOR

## 1. Hosting
Deploy the Next.js project to Vercel (or another Next.js host). Vercel has first-class Next.js support and supports custom domains.

## 2. Supabase
Create a Supabase project, run `supabase/schema.sql`, create a private `media` storage bucket (or separate buckets for gallery/blog/services/projects/products), and configure RLS policies.

Environment variables:
- NEXT_PUBLIC_SUPABASE_URL
- NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY

Use Supabase Auth for the admin account. Do not use the prototype password in production.

## 3. GoDaddy
In the domain DNS settings for `edunavigator.co.in`, add the custom-domain record required by the hosting provider for `zco`. After DNS propagation, the site will be available at `https://zco.edunavigator.co.in`.

## 4. Forms
Connect the Book Consultation and Contact forms to `consultation_requests` and `enquiries` respectively. Admin should read/update these through authenticated server-side actions or protected Supabase policies.

## 5. Content
Replace the sample content in `app/data.ts` with Supabase queries. Admin CRUD should write to the tables in `supabase/schema.sql`, while media files should be uploaded to Supabase Storage.
