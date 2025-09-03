-- Cleanups

drop function if exists public.set_updated_at cascade;
drop schema if exists public cascade;

-- Common parts of the SQL schema,

create schema public;

create function public.set_updated_at() returns trigger as $$
begin
  new.updated_at := current_timestamp;
  return new;
end;
$$ language plpgsql;

--- The main schema

-- Users table
-- Stores user information with embedded name fields
create table public.users (
    id uuid primary key default gen_random_uuid(),
    email text not null unique,
    first_name text not null,
    last_name text not null,
    created_at timestamptz not null default current_timestamp,
    updated_at timestamptz not null default current_timestamp
);

comment on table public.users is 'User accounts with personal information';
comment on column public.users.id is 'Unique identifier for the user';
comment on column public.users.email is 'User email address, must be unique';
comment on column public.users.first_name is 'User first name';
comment on column public.users.last_name is 'User last name';
comment on column public.users.created_at is 'Timestamp when user was created';
comment on column public.users.updated_at is 'Timestamp when user was last updated';

-- Posts table
-- Stores blog posts with categorization
create table public.posts (
    id uuid primary key default gen_random_uuid(),
    author_id uuid not null references public.users(id) on delete cascade,
    category text not null,
    title text not null,
    created_at timestamptz not null default current_timestamp,
    updated_at timestamptz not null default current_timestamp,
    constraint posts_category_check check (category in ('tutorial', 'opinion', 'review'))
);

comment on table public.posts is 'Blog posts created by users';
comment on column public.posts.id is 'Unique identifier for the post';
comment on column public.posts.author_id is 'Foreign key reference to the user who created the post';
comment on column public.posts.category is 'Post category: tutorial, opinion, or review';
comment on column public.posts.title is 'Title of the post';
comment on column public.posts.created_at is 'Timestamp when post was created';
comment on column public.posts.updated_at is 'Timestamp when post was last updated';

-- Post comments table
-- Stores comments on posts
create table public.post_comments (
    id uuid primary key default gen_random_uuid(),
    post_id uuid not null references public.posts(id) on delete cascade,
    author_id uuid not null references public.users(id) on delete cascade,
    content text not null,
    created_at timestamptz not null default current_timestamp,
    updated_at timestamptz not null default current_timestamp
);

comment on table public.post_comments is 'Comments on blog posts';
comment on column public.post_comments.id is 'Unique identifier for the comment';
comment on column public.post_comments.post_id is 'Foreign key reference to the post being commented on';
comment on column public.post_comments.author_id is 'Foreign key reference to the user who created the comment';
comment on column public.post_comments.content is 'Text content of the comment';
comment on column public.post_comments.created_at is 'Timestamp when comment was created';
comment on column public.post_comments.updated_at is 'Timestamp when comment was last updated';

-- Create triggers for updated_at columns
create trigger users_set_updated_at
    before update on public.users
    for each row
    execute function public.set_updated_at();

create trigger posts_set_updated_at
    before update on public.posts
    for each row
    execute function public.set_updated_at();

create trigger post_comments_set_updated_at
    before update on public.post_comments
    for each row
    execute function public.set_updated_at();

-- Create indexes for better query performance
create index idx_posts_author_id on public.posts(author_id);
create index idx_posts_category on public.posts(category);
create index idx_posts_created_at on public.posts(created_at desc);
create index idx_post_comments_post_id on public.post_comments(post_id);
create index idx_post_comments_author_id on public.post_comments(author_id);
create index idx_post_comments_created_at on public.post_comments(created_at desc);

-- User post statistics view
-- Shows for each user: total posts count and average comments per post
create view public.user_post_stats as
select
    u.id as user_id,
    u.email,
    u.first_name,
    u.last_name,
    coalesce(post_stats.total_posts, 0) as total_posts,
    coalesce(post_stats.avg_comments_per_post, 0.0) as avg_comments_per_post
from
    public.users u
left join (
    select
        p.author_id,
        count(p.id) as total_posts,
        round(avg(comment_counts.comment_count), 2) as avg_comments_per_post
    from
        public.posts p
    left join (
        select
            post_id,
            count(*) as comment_count
        from
            public.post_comments
        group by
            post_id
    ) comment_counts on p.id = comment_counts.post_id
    group by
        p.author_id
) post_stats on u.id = post_stats.author_id
order by
    total_posts desc, avg_comments_per_post desc;

comment on view public.user_post_stats is 'User statistics showing total posts and average comments per post';
