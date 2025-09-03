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
