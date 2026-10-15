# ZCO EDU NAVIGATOR

Production-ready starting point for the ZCO education consultancy website at `https://zco.edunavigator.co.in`.

## Scope implemented
- Premium black/white ZCO visual system
- 10 primary pages: Home, About, Services, Projects, Products, Blog, Gallery, Consultation, FAQs, Contact
- Dynamic-style detail routes for Services, Projects, Products and Blog
- Enquiry and Book Consultation forms
- Admin dashboard prototype with content sections
- SEO metadata, sitemap and robots.txt
- Supplied ZCO logo assets used from the provided package

## Stack
Next.js App Router + React + TypeScript. The intended production backend is Supabase for Postgres, Auth and Storage. Supabase provides Postgres, authentication and file storage with row-level security policies. See the official docs linked in the project handoff.

## Run locally
1. Install Node.js 20+.
2. `npm install`
3. `npm run dev`
4. Open `http://localhost:3000`

## Admin prototype
Open `/admin`. Demo password: `zco-admin`.
This password is only for the prototype and must be replaced with real authentication before production.

## Production backend
Create a Supabase project and add environment variables:
- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`

Then implement the supplied database schema and RLS policies for content, enquiries and consultation requests. Never expose a Supabase service-role/secret key in browser code.

## GoDaddy subdomain
After deploying the Next.js app to a hosting provider such as Vercel, add `zco` as the custom domain/subdomain and follow the DNS record Vercel provides. The result should be `https://zco.edunavigator.co.in`.
