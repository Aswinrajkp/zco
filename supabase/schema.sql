create extension if not exists pgcrypto;

create table if not exists public.services (
  id uuid primary key default gen_random_uuid(), title text not null, slug text unique not null,
  short_description text, content text, image_url text, seo_title text, seo_description text,
  published boolean default true, created_at timestamptz default now(), updated_at timestamptz default now()
);
create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(), title text not null, slug text unique not null,
  short_description text, content text, image_url text, seo_title text, seo_description text,
  published boolean default true, created_at timestamptz default now(), updated_at timestamptz default now()
);
create table if not exists public.products (
  id uuid primary key default gen_random_uuid(), title text not null, slug text unique not null,
  short_description text, content text, image_url text, seo_title text, seo_description text,
  published boolean default true, created_at timestamptz default now(), updated_at timestamptz default now()
);
create table if not exists public.blog_posts (
  id uuid primary key default gen_random_uuid(), title text not null, slug text unique not null,
  excerpt text, content text, featured_image_url text, seo_title text, seo_description text,
  published boolean default true, published_at timestamptz, created_at timestamptz default now(), updated_at timestamptz default now()
);
create table if not exists public.gallery_items (
  id uuid primary key default gen_random_uuid(), title text, image_url text not null,
  category text, alt_text text, published boolean default true, created_at timestamptz default now()
);
create table if not exists public.faqs (
  id uuid primary key default gen_random_uuid(), question text not null, answer text not null,
  sort_order int default 0, published boolean default true, created_at timestamptz default now(), updated_at timestamptz default now()
);
create table if not exists public.team_members (
  id uuid primary key default gen_random_uuid(), name text not null, role text, bio text,
  image_url text, sort_order int default 0, published boolean default true, created_at timestamptz default now()
);
create table if not exists public.careers (
  id uuid primary key default gen_random_uuid(), title text not null, location text, description text,
  published boolean default true, created_at timestamptz default now()
);
create table if not exists public.enquiries (
  id uuid primary key default gen_random_uuid(), name text not null, phone text not null, email text,
  subject text, message text, status text default 'new', created_at timestamptz default now()
);
create table if not exists public.consultation_requests (
  id uuid primary key default gen_random_uuid(), full_name text not null, phone text not null, email text,
  city text, education_level text, area_of_interest text, preferred_date date, preferred_time time,
  message text, status text default 'new', created_at timestamptz default now()
);

alter table public.services enable row level security;
alter table public.projects enable row level security;
alter table public.products enable row level security;
alter table public.blog_posts enable row level security;
alter table public.gallery_items enable row level security;
alter table public.faqs enable row level security;
alter table public.team_members enable row level security;
alter table public.careers enable row level security;
alter table public.enquiries enable row level security;
alter table public.consultation_requests enable row level security;

create policy "public read published services" on public.services for select using (published = true);
create policy "public read published projects" on public.projects for select using (published = true);
create policy "public read published products" on public.products for select using (published = true);
create policy "public read published blog" on public.blog_posts for select using (published = true);
create policy "public read published gallery" on public.gallery_items for select using (published = true);
create policy "public read published faqs" on public.faqs for select using (published = true);
create policy "public read published team" on public.team_members for select using (published = true);
create policy "public read published careers" on public.careers for select using (published = true);
create policy "public submit enquiry" on public.enquiries for insert with check (true);
create policy "public submit consultation" on public.consultation_requests for insert with check (true);

-- Admin CRUD should be implemented through authenticated admin policies or a server-side service role.
-- Never expose a service-role/secret key in browser code.
