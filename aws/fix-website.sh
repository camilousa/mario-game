#!/bin/bash
# ============================================================
# fix-website.sh — Activa el hosting web en un bucket existente
# Úsalo si ya tienes el bucket creado pero ves el error 404
# NoSuchWebsiteConfiguration
# Uso: ./aws/fix-website.sh
# ============================================================

set -e
source "$(dirname "$0")/config.sh"

echo ""
echo "🌐 Habilitando sitio web estático en: $S3_BUCKET"

aws s3api put-bucket-website \
  --bucket "$S3_BUCKET" \
  --website-configuration '{
    "IndexDocument": {"Suffix": "index.html"},
    "ErrorDocument": {"Key": "index.html"}
  }'

echo "🔓 Verificando acceso público..."

# Quitar bloqueo de acceso público
aws s3api delete-public-access-block \
  --bucket "$S3_BUCKET"

# Aplicar política de lectura pública
aws s3api put-bucket-policy \
  --bucket "$S3_BUCKET" \
  --policy "{
    \"Version\": \"2012-10-17\",
    \"Statement\": [{
      \"Sid\": \"PublicRead\",
      \"Effect\": \"Allow\",
      \"Principal\": \"*\",
      \"Action\": \"s3:GetObject\",
      \"Resource\": \"arn:aws:s3:::${S3_BUCKET}/*\"
    }]
  }"

echo ""
echo "✅ Listo — vuelve a correr ./aws/deploy.sh"
echo ""
echo "   URL del juego: $GAME_URL"
echo ""
