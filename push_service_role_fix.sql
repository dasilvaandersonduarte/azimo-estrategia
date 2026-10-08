-- Rodar no Supabase Dashboard → SQL Editor
-- Corrige a mesma pegadinha de antes (criar tabela pelo SQL Editor nao concede
-- privilegios automaticamente), dessa vez para o papel que o Worker usa
-- (service_role) nas duas tabelas de push.

grant select, insert, update, delete on public.push_subscriptions to service_role;
grant select, insert, update, delete on public.push_enviados to service_role;
