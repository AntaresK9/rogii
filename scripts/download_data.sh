#!/usr/bin/env bash
# Descarga y descomprime los datos de la competencia en data/raw/
set -euo pipefail
COMP="rogii-wellbore-geology-prediction"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RAW="$ROOT/data/raw"

if [ -f "$ROOT/.env" ]; then set -a; . "$ROOT/.env"; set +a; fi

mkdir -p "$RAW"
uv run kaggle competitions download -c "$COMP" -p "$RAW"
uv run python -c "import sys,zipfile; zipfile.ZipFile(sys.argv[1]).extractall(sys.argv[2])" "$RAW/$COMP.zip" "$RAW"
rm -f "$RAW/$COMP.zip"
echo "Datos en $RAW:" && ls -lh "$RAW"
