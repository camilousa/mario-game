#!/bin/bash
# ============================================================
# CONFIGURACIÓN AWS — Mario IA Demo (solo S3)
# Edita este archivo con tus datos reales antes de la demo
# ============================================================

# Tu bucket de S3 (debe tener un nombre único global)
export S3_BUCKET="mario-ia-demo-2026"

# Región de AWS donde creaste el bucket
export AWS_DEFAULT_REGION="us-east-1"

# URL pública del juego (S3 static website)
# Formato: http://BUCKET.s3-website-REGION.amazonaws.com
export GAME_URL="http://${S3_BUCKET}.s3-website-${AWS_DEFAULT_REGION}.amazonaws.com/index.html"

echo "✓ Config cargada"
echo "  Bucket:  s3://$S3_BUCKET"
echo "  Región:  $AWS_DEFAULT_REGION"
echo "  URL:     $GAME_URL"
