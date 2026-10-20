-- Azimo | vínculo do convite beta com o nome informado ao gerar o acesso.
-- Executar uma vez no SQL Editor do projeto Supabase Azimo antes de publicar o novo fluxo de geração.
ALTER TABLE public.azimo_beta_invites
  ADD COLUMN IF NOT EXISTS destinatario_nome text;

-- Convites antigos continuam legíveis, sem inventar nomes para eles.
-- O Worker exige um nome de até 120 caracteres para todos os convites novos.
