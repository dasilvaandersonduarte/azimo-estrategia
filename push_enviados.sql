-- Rodar no Supabase Dashboard → SQL Editor
-- Controle de quais avisos já foram disparados pelo cron do Worker, pra não
-- mandar o mesmo aviso duas vezes (o cron roda a cada 5 minutos e a janela de
-- tolerância é de 5 minutos, então sem isso dá pra mandar repetido)

create table public.push_enviados (
  chave text primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  enviado_em timestamptz default now()
);

alter table public.push_enviados enable row level security;

-- Só o Worker (chave de serviço) mexe nessa tabela, ninguém pelo app
create policy "bloqueia_acesso_direto"
  on public.push_enviados
  for all
  to authenticated
  using (false);
