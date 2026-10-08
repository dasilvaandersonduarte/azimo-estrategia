-- ============================================================
-- Azimo: tabela de assinantes
-- Rodar no Supabase SQL Editor (projeto yvikqakjdjsyiqrkyoze)
-- ============================================================

CREATE TABLE IF NOT EXISTS public.subscribers (
  id                     uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id                uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  email                  text NOT NULL UNIQUE,
  status                 text NOT NULL DEFAULT 'pendente'
                           CHECK (status IN ('ativo', 'cancelado', 'expirado', 'pendente')),
  plan_type              text CHECK (plan_type IN ('mensal', 'anual')),
  stripe_customer_id     text,
  stripe_subscription_id text,
  current_period_end     timestamptz,
  created_at             timestamptz DEFAULT now(),
  updated_at             timestamptz DEFAULT now()
);

-- Índices
CREATE INDEX IF NOT EXISTS subscribers_user_id_idx ON public.subscribers(user_id);
CREATE INDEX IF NOT EXISTS subscribers_email_idx   ON public.subscribers(email);
CREATE INDEX IF NOT EXISTS subscribers_status_idx  ON public.subscribers(status);

-- RLS
ALTER TABLE public.subscribers ENABLE ROW LEVEL SECURITY;

-- Usuário autenticado lê apenas sua própria linha
CREATE POLICY "user_read_own_subscription"
  ON public.subscribers
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

-- ============================================================
-- Trigger: atualizar updated_at automaticamente
-- ============================================================
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER subscribers_updated_at
  BEFORE UPDATE ON public.subscribers
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

-- ============================================================
-- RPC: buscar user_id pelo email (chamada pelo webhook Worker)
-- Roda com SECURITY DEFINER para acessar auth.users
-- ============================================================
CREATE OR REPLACE FUNCTION public.get_user_id_by_email(p_email text)
RETURNS uuid
LANGUAGE sql
SECURITY DEFINER
SET search_path = auth, public
AS $$
  SELECT id FROM auth.users WHERE email = p_email LIMIT 1;
$$;

GRANT EXECUTE ON FUNCTION public.get_user_id_by_email(text) TO service_role;
