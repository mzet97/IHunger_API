#!/bin/bash
# ============================================
# IHunger API - Docker Reset Script
# Usage: ./scripts/docker-reset.sh
# ============================================

set -e

echo "🔄 Resetting IHunger Docker environment..."
echo ""

# Stop and remove everything
echo "1/3 - Stopping containers and removing volumes..."
docker compose --profile tools --profile cache down -v --remove-orphans 2>/dev/null || true

# Remove images
echo "2/3 - Removing IHunger API image..."
docker rmi ihunger-api 2>/dev/null || true

# Rebuild and start
echo "3/3 - Rebuilding and starting..."
docker compose up -d --build

echo ""
echo "✅ Reset complete!"
echo "   API:     http://localhost:5000"
echo "   Swagger: http://localhost:5000/swagger"
