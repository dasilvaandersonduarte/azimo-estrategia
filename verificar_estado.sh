#!/bin/bash
# Verifica o estado real dos 3 repositorios do Azimo contra o GitHub.
# Roda isso SEMPRE no inicio de uma sessao, antes de confiar no texto do STATUS.md.
# Qualquer agente (Claude ou GPT) pode rodar este script.

set -e
BASE="$HOME/mnt/Azimo/Projeto"
REPOS=("Empresa/azimo-site" "Estratégia" "Empresa/Worker")
NOMES=("azimo-site" "azimo-estrategia" "azimo-worker")

echo "===================================================="
echo " VERIFICACAO DE ESTADO REAL - $(date '+%Y-%m-%d %H:%M')"
echo "===================================================="

for i in "${!REPOS[@]}"; do
  dir="${BASE}/${REPOS[$i]}"
  nome="${NOMES[$i]}"
  echo ""
  echo "--- $nome ---"
  if [ ! -d "$dir/.git" ]; then
    echo "[FALHA] diretorio nao encontrado ou nao e repo git: $dir"
    continue
  fi
  cd "$dir"

  git fetch origin main --quiet 2>&1 || { echo "[FALHA] fetch nao funcionou. Verifique credential.helper com: git config credential.helper"; continue; }

  local_hash=$(git rev-parse main 2>/dev/null)
  remote_hash=$(git rev-parse origin/main 2>/dev/null)
  sujo=$(git status --porcelain | grep -v '.DS_Store' | wc -l | tr -d ' ')

  if [ "$local_hash" = "$remote_hash" ]; then
    echo "[OK] local == origin/main  ($local_hash)"
  else
    echo "[DIVERGENTE] local=$local_hash  origin/main=$remote_hash"
    echo "   -> provavelmente precisa de 'git merge --ff-only origin/main' (ou ha commits locais nao publicados)"
  fi

  if [ "$sujo" != "0" ]; then
    echo "[ATENCAO] ha $sujo arquivo(s) alterado(s) nao commitado(s) (ignorando .DS_Store)"
  fi

  echo "   ultimo commit: $(git log -1 --format='%h %s (%ci)')"
done

echo ""
echo "===================================================="
echo "Se algum repo nao estiver [OK], NAO confie no texto do"
echo "STATUS.md sem reconciliar antes de continuar o trabalho."
echo "===================================================="
