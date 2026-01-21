#!/bin/bash
set -e

# ======================
# Variáveis
# ======================
PROJECT_NAME="drogal-360-front"
TAG="${TAG:-latest}"
PLATFORM="${PLATFORM:-linux/amd64}"

ECR_REGISTRY="179095145246.dkr.ecr.sa-east-1.amazonaws.com"
IMAGE_NAME="drg/${PROJECT_NAME}"
ECR_IMAGE="${ECR_REGISTRY}/drg/${PROJECT_NAME}"

# ======================
# Validações
# ======================
command -v docker >/dev/null 2>&1 || { echo "❌ Docker não está instalado"; exit 1; }
command -v yarn   >/dev/null 2>&1 || { echo "❌ Yarn não está instalado"; exit 1; }

# ======================
# Build do projeto
# ======================
echo "🚀 Buildando projeto..."
yarn build

# ======================
# Build da imagem Docker
# ======================
echo "🐳 Buildando imagem Docker..."
docker build \
  --no-cache \
  --platform "$PLATFORM" \
  -f docker/Dockerfile \
  -t "$IMAGE_NAME:$TAG" \
  .

# ======================
# Tag para o ECR
# ======================
echo "🏷️ Gerando tag para o ECR..."
docker tag "$IMAGE_NAME:$TAG" "$ECR_IMAGE:$TAG"

# ======================
# Push para o ECR
# ======================
echo "📤 Enviando imagem para o ECR..."
docker push "$ECR_IMAGE:$TAG"

echo "✅ Deploy para o ECR finalizado com sucesso!"
