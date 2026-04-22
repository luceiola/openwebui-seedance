#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="${ROOT_DIR}/config/ark.env"

if [[ ! -f "${ENV_FILE}" ]]; then
  echo "[ERROR] Missing env file: ${ENV_FILE}"
  exit 1
fi

set -a
source "${ENV_FILE}"
set +a

if [[ -z "${ARK_API_KEY:-}" ]]; then
  echo "[ERROR] ARK_API_KEY is empty in ${ENV_FILE}"
  exit 2
fi

if [[ "${MATERIAL_PACK_TOS_ENABLED:-false}" =~ ^(1|true|TRUE|yes|YES|on|ON)$ ]]; then
  if ! "${ROOT_DIR}/.venv/bin/python" -c "import tos" >/dev/null 2>&1; then
    echo "[ERROR] MATERIAL_PACK_TOS_ENABLED=true but python package 'tos' is missing."
    echo "Run: source .venv/bin/activate && pip install tos"
    exit 3
  fi
fi

cd "${ROOT_DIR}"
exec ./.venv/bin/open-webui serve --host 127.0.0.1 --port 8080
