-- AZIMO: preparação do beta gratuito, ativo até revogação.
-- Executar manualmente no SQL Editor do projeto Azimo, conforme protocolo seção 5.
-- Cria somente estruturas novas. Não altera subscribers, Stripe ou usuários existentes.
-- O fluxo no aplicativo ainda depende da implantação do Worker/frontend de beta.
-- Execute uma única vez; nomes existentes interrompem a transação sem sobrescrita.
BEGIN;
CREATE TABLE public.azimo_beta_invites (
  code uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz NOT NULL DEFAULT now(),
  created_by uuid NOT NULL REFERENCES auth.users(id),
  redeemed_at timestamptz,
  redeemed_by uuid REFERENCES auth.users(id),
  revoked_at timestamptz,
  CHECK ((redeemed_at IS NULL) = (redeemed_by IS NULL))
);
CREATE TABLE public.azimo_beta_access (
  user_id uuid PRIMARY KEY REFERENCES auth.users(id),
  granted_at timestamptz NOT NULL DEFAULT now(),
  invite_code uuid NOT NULL REFERENCES public.azimo_beta_invites(code),
  revoked_at timestamptz
);
ALTER TABLE public.azimo_beta_invites ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.azimo_beta_access ENABLE ROW LEVEL SECURITY;
REVOKE ALL ON public.azimo_beta_invites, public.azimo_beta_access FROM PUBLIC, anon, authenticated;
GRANT SELECT, INSERT, UPDATE ON public.azimo_beta_invites, public.azimo_beta_access TO service_role;

-- Somente o Worker autenticado pode chamar esta função com a service key.
-- O Worker deve obter p_user_id do token validado, nunca do corpo fornecido pelo cliente.
CREATE FUNCTION public.azimo_redeem_beta(p_code uuid, p_user_id uuid)
RETURNS boolean
LANGUAGE plpgsql SECURITY DEFINER SET search_path = '' AS $$
DECLARE v_invite public.azimo_beta_invites%ROWTYPE;
BEGIN
  IF p_user_id IS NULL THEN RETURN false; END IF;
  SELECT * INTO v_invite FROM public.azimo_beta_invites WHERE code=p_code FOR UPDATE;
  IF NOT FOUND OR v_invite.revoked_at IS NOT NULL THEN RETURN false; END IF;
  IF v_invite.redeemed_by IS NOT NULL THEN
    RETURN v_invite.redeemed_by=p_user_id AND EXISTS (
      SELECT 1 FROM public.azimo_beta_access WHERE user_id=p_user_id AND revoked_at IS NULL
    );
  END IF;
  -- Não converter uma assinatura vigente em acesso beta nem alterar sua cobrança.
  IF EXISTS (SELECT 1 FROM public.subscribers WHERE user_id=p_user_id AND
    (status='ativo' OR (status IN ('trial','cancelamento_agendado') AND current_period_end>now())))
  THEN RETURN false; END IF;
  UPDATE public.azimo_beta_invites SET redeemed_by=p_user_id,redeemed_at=now() WHERE code=p_code;
  INSERT INTO public.azimo_beta_access(user_id,invite_code) VALUES(p_user_id,p_code)
  ON CONFLICT(user_id) DO UPDATE SET invite_code=EXCLUDED.invite_code,granted_at=now(),revoked_at=NULL;
  RETURN true;
END;
$$;
REVOKE ALL ON FUNCTION public.azimo_redeem_beta(uuid,uuid) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.azimo_redeem_beta(uuid,uuid) TO service_role;
COMMIT;
