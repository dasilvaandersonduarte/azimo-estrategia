-- Rodar no Supabase Dashboard → SQL Editor
-- Corrige a permissão que faltou na tabela push_subscriptions (criar a tabela
-- pelo SQL Editor não dá automaticamente o acesso que o app precisa, isso é
-- separado das regras de RLS que já existem) e adiciona a regra de update que
-- faltava (o upsert usa update quando o endpoint já existe)

grant select, insert, update, delete on public.push_subscriptions to authenticated;

create policy "update_own_subscription"
  on public.push_subscriptions
  for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
