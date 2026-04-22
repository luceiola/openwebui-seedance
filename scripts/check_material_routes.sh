#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://127.0.0.1:8080}"

if ! command -v jq >/dev/null 2>&1; then
  echo "[ERROR] jq is required"
  exit 1
fi

ROUTES="$(curl -sS "${BASE_URL}/openapi.json" | jq -r '.paths | keys[]' | rg '/api/v1/material-packages' || true)"

if [[ -z "${ROUTES}" ]]; then
  echo "[FAIL] material-packages routes not found in ${BASE_URL}/openapi.json"
  echo "Hint: restart open-webui from the patched environment."
  exit 2
fi

echo "[OK] material-packages routes detected:"
echo "${ROUTES}"
