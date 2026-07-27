#!/bin/bash
# ============================================
# IHunger API - Docker Down Script
# Usage: ./scripts/docker-down.sh [--volumes]
# ============================================

set -e

if [ "$1" = "--volumes" ]; then
    echo "⚠️  Stopping services and removing volumes..."
    docker compose --profile tools --profile cache down -v
    echo "✅ All services stopped and volumes removed."
else
    echo "🛑 Stopping services..."
    docker compose --profile tools --profile cache down
    echo "✅ All services stopped."
fi
