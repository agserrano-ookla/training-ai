-- Cleanups
drop function if exists public.set_updated_at cascade;
drop schema if exists public cascade;

-- Common parts
create schema public;
create function public.set_updated_at() returns trigger as $$
begin
  new.updated_at := current_timestamp;
  return new;
end;
$$ language plpgsql;

-- Users table
create table public.users (
  id uuid primary key default gen_random_uuid(), -- Unique user ID
  email text not null, -- User email
  name_first text not null, -- First name
  name_last text not null, -- Last name
  created_at timestamp not null default current_timestamp, -- Creation timestamp
  updated_at timestamp not null default current_timestamp, -- Last update timestamp
  constraint email_unique unique(email)
);
comment on table public.users is 'Stores user accounts';
comment on column public.users.id is 'Unique user ID';
comment on column public.users.email is 'User email';
comment on column public.users.name_first is 'First name';
comment on column public.users.name_last is 'Last name';
comment on column public.users.created_at is 'Creation timestamp';
comment on column public.users.updated_at is 'Last update timestamp';

-- Posts table
create table public.posts (
  id uuid primary key default gen_random_uuid(), -- Unique post ID
  author_id uuid not null references public.users(id), -- Author user ID
  category text not null, -- Post category
  title text not null, -- Post title
  created_at timestamp not null default current_timestamp, -- Creation timestamp
  updated_at timestamp not null default current_timestamp, -- Last update timestamp
  constraint post_category_check check (category in ('tutorial', 'opinion', 'review'))
);
comment on table public.posts is 'Stores blog posts';
comment on column public.posts.id is 'Unique post ID';
comment on column public.posts.author_id is 'Author user ID';
comment on column public.posts.category is 'Post category';
comment on column public.posts.title is 'Post title';
comment on column public.posts.created_at is 'Creation timestamp';
comment on column public.posts.updated_at is 'Last update timestamp';

-- Post comments table
create table public.post_comments (
  id uuid primary key default gen_random_uuid(), -- Unique comment ID
  post_id uuid not null references public.posts(id), -- Related post ID
  author_id uuid not null references public.users(id), -- Author user ID
  content text not null, -- Comment content
  created_at timestamp not null default current_timestamp, -- Creation timestamp
  updated_at timestamp not null default current_timestamp -- Last update timestamp
);
comment on table public.post_comments is 'Stores comments on posts';
comment on column public.post_comments.id is 'Unique comment ID';
comment on column public.post_comments.post_id is 'Related post ID';
comment on column public.post_comments.author_id is 'Author user ID';
comment on column public.post_comments.content is 'Comment content';
comment on column public.post_comments.created_at is 'Creation timestamp';
comment on column public.post_comments.updated_at is 'Last update timestamp';

-- Triggers for updated_at
create trigger set_updated_at_users before update on public.users
  for each row execute procedure public.set_updated_at();
create trigger set_updated_at_posts before update on public.posts
  for each row execute procedure public.set_updated_at();
create trigger set_updated_at_post_comments before update on public.post_comments
  for each row execute procedure public.set_updated_at();
