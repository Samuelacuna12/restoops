-- Esquema futuro para persistencia centralizada en Supabase/Postgres.
create table if not exists restaurants (
  id text primary key,
  name text not null,
  active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists ingredients (
  id uuid primary key default gen_random_uuid(),
  restaurant_id text null references restaurants(id),
  name text not null,
  category text,
  purchase_qty numeric not null,
  purchase_unit text not null,
  purchase_cost numeric not null,
  stock_base numeric not null default 0,
  stock_display_unit text not null,
  created_at timestamptz not null default now()
);

create table if not exists recipes (
  id uuid primary key default gen_random_uuid(),
  restaurant_id text not null references restaurants(id),
  name text not null,
  sale_price numeric not null default 0,
  packaging_cost numeric not null default 0,
  other_cost numeric not null default 0,
  target_margin numeric not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists recipe_lines (
  id uuid primary key default gen_random_uuid(),
  recipe_id uuid not null references recipes(id) on delete cascade,
  ingredient_id uuid not null references ingredients(id),
  qty numeric not null,
  unit text not null
);

create table if not exists sales (
  id uuid primary key default gen_random_uuid(),
  restaurant_id text not null references restaurants(id),
  recipe_id uuid null references recipes(id),
  recipe_name text not null,
  qty numeric not null,
  unit_price numeric not null,
  unit_cost numeric not null,
  sale_date date not null,
  consumption jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);

insert into restaurants (id,name) values
('asu-mare','Asu Mare'),
('oh-my-chicken','Oh My Chicken'),
('don-arroz','Don Arroz')
on conflict (id) do nothing;
