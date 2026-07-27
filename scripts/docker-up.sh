#!/bin/bash
# ============================================
# IHunger API - Docker Up Script
# Usage: ./scripts/docker-up.sh [dev|tools|cache]
# ============================================

set -e

PROFILE=""
COMPOSE_PROFILES=""

case "${1:-dev}" in
    dev)
        echo "🚀 Starting IHunger API + PostgreSQL..."
        docker compose up -d
        ;;
    tools)
        echo "🚀 Starting IHunger API + PostgreSQL + pgAdmin..."
        docker compose --profile tools up -d
        ;;
    cache)
        echo "🚀 Starting IHunger API + PostgreSQL + Redis..."
        docker compose --profile cache up -d
        ;;
    all)
        echo "🚀 Starting all services..."
        docker compose --profile tools --profile cache up -d
        ;;
    *)
        echo "Usage: $0 [dev|tools|cache|all]"
        exit 1
        ;;
esac

echo ""
echo "✅ Services started!"
echo "   API:     http://localhost:5000"
echo "   Swagger: http://localhost:5000/swagger"
echo "   Health:  http://localhost:5000/health"
echo ""
echo "📋 Useful commands:"
echo "   docker compose logs -f api    # Follow API logs"
echo "   docker compose ps             # List running containers"
echo "   docker compose down           # Stop all services"
