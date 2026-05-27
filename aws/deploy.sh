#!/bin/bash
# ============================================================
# deploy.sh — Sube el juego generado a AWS S3 (sin CloudFront)
# Uso: ./aws/deploy.sh
# ============================================================

set -e
source "$(dirname "$0")/config.sh"

GAME_FILE="index.html"

if [ ! -f "$GAME_FILE" ]; then
  echo "❌ No encontré $GAME_FILE — genera el juego primero con Claude Code"
  exit 1
fi

echo ""
echo "🚀 Subiendo juego a AWS S3..."

# Nota: sin --acl public-read (los buckets S3 modernos no usan ACLs)
# El acceso público se controla desde la política del bucket (setup-bucket.sh)
aws s3 cp "$GAME_FILE" "s3://$S3_BUCKET/index.html" \
  --content-type "text/html" \
  --cache-control "no-cache"

echo ""
echo "✅ ¡Juego desplegado!"
echo ""
echo "   URL pública: $GAME_URL"
echo ""
echo "   (Disponible en segundos — no hay caché que esperar)"
echo ""

# Abre la URL en el navegador automáticamente
if command -v open &>/dev/null; then
  open "$GAME_URL"
elif command -v xdg-open &>/dev/null; then
  xdg-open "$GAME_URL"
elif command -v start &>/dev/null; then
  start "$GAME_URL"
fi
