-- Rodar no Supabase Dashboard → SQL Editor
-- Cria a tabela de feedbacks dos usuários do Azimo

create table public.feedbacks (
  id uuid default gen_random_uuid() primary key,
  texto text not null,
  categoria text default 'Geral',
  user_email text,
  criado_em timestamptz default now()
);

-- Ativa RLS
alter table public.feedbacks enable row level security;

-- Usuários autenticados podem inserir
create policy "insert_feedback"
  on public.feedbacks
  for insert
  to authenticated
  with check (true);

-- Somente o admin (Anderson) pode ler
create policy "admin_read_feedback"
  on public.feedbacks
  for select
  using (auth.jwt() ->> 'email' = 'dasilvaandersonduarte@gmail.com');
