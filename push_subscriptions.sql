-- Rodar no Supabase Dashboard → SQL Editor
-- Cria a tabela que guarda a inscrição de notificação push de cada aparelho
-- de cada usuário do Azimo (item 112, notificação com o app fechado)

create table public.push_subscriptions (
  id uuid default gen_random_uuid() primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  endpoint text not null unique,
  p256dh text not null,
  auth_key text not null,
  aparelho text,
  criado_em timestamptz default now()
);

-- Ativa RLS
alter table public.push_subscriptions enable row level security;

-- Cada usuário só vê/mexe nas próprias inscrições
create policy "select_own_subscription"
  on public.push_subscriptions
  for select
  to authenticated
  using (auth.uid() = user_id);

create policy "insert_own_subscription"
  on public.push_subscriptions
  for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "delete_own_subscription"
  on public.push_subscriptions
  for delete
  to authenticated
  using (auth.uid() = user_id);

-- Índice pra consulta por usuário (o Worker filtra por user_id na hora de disparar)
create index push_subscriptions_user_id_idx on public.push_subscriptions(user_id);
