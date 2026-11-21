#!/usr/bin/env bash
# Uso: scripts/submit.sh submissions/archivo.csv "mensaje"
set -euo pipefail
COMP="rogii-wellbore-geology-prediction"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
if [ -f "$ROOT/.env" ]; then set -a; . "$ROOT/.env"; set +a; fi
FILE="${1:?falta el archivo csv}"
MSG="${2:-$(basename "$FILE")}"
uv run kaggle competitions submit -c "$COMP" -f "$FILE" -m "$MSG"
