-- ============================================================
-- Azimo: solicitacoes de cancelamento + politicas admin
-- Rodar no Supabase SQL Editor (projeto yvikqakjdjsyiqrkyoze)
-- ============================================================

-- Tabela de solicitacoes de cancelamento
CREATE TABLE IF NOT EXISTS public.cancelamento_solicitacoes (
  id         uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id    uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  email      text NOT NULL,
  nome       text,
  motivo     text,
  status     text DEFAULT 'pendente' CHECK (status IN ('pendente', 'processado')),
  created_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS cancelamento_status_idx ON public.cancelamento_solicitacoes(status);
CREATE INDEX IF NOT EXISTS cancelamento_email_idx  ON public.cancelamento_solicitacoes(email);

ALTER TABLE public.cancelamento_solicitacoes ENABLE ROW LEVEL SECURITY;

-- Usuarios so podem inserir (nao ler de volta)
CREATE POLICY "user_insert_cancelamento"
  ON public.cancelamento_solicitacoes
  FOR INSERT TO authenticated
  WITH CHECK (auth.uid() = user_id);

-- Admin pode tudo em cancelamento_solicitacoes
CREATE POLICY "admin_all_cancelamento"
  ON public.cancelamento_solicitacoes
  FOR ALL TO authenticated
  USING (auth.jwt() ->> 'email' = 'dasilvaandersonduarte@gmail.com')
  WITH CHECK (auth.jwt() ->> 'email' = 'dasilvaandersonduarte@gmail.com');

-- ============================================================
-- Politicas admin para subscribers
-- (admin pode ver e cancelar qualquer assinante)
-- ============================================================

CREATE POLICY "admin_read_subscribers"
  ON public.subscribers
  FOR SELECT TO authenticated
  USING (auth.jwt() ->> 'email' = 'dasilvaandersonduarte@gmail.com');

CREATE POLICY "admin_update_subscribers"
  ON public.subscribers
  FOR UPDATE TO authenticated
  USING (auth.jwt() ->> 'email' = 'dasilvaandersonduarte@gmail.com')
  WITH CHECK (auth.jwt() ->> 'email' = 'dasilvaandersonduarte@gmail.com');

-- Usuario pode ver sua propria assinatura (ja existe, mas garantindo)
-- Se ja existir a policy "user_read_own_subscription", esse bloco pode ser ignorado
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'subscribers' AND policyname = 'user_read_own_subscription'
  ) THEN
    EXECUTE $pol$
      CREATE POLICY "user_read_own_subscription"
        ON public.subscribers
        FOR SELECT TO authenticated
        USING (auth.uid() = user_id)
    $pol$;
  END IF;
END $$;
