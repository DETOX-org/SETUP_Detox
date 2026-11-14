#!/usr/bin/env bash
# ============================================================
# SETUP_Detox — One-Command Hackathon Project Setup (Linux/Mac)
# ============================================================
# Usage: bash setup.sh [--name "MyHackathon"] [--remote "https://github.com/..."]
# ============================================================

set -e

ROOT="$(cd "$(dirname "$0")" && pwd)"
PROJECT_NAME=""
GIT_REMOTE=""
SKIP_GIT=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --name) PROJECT_NAME="$2"; shift 2 ;;
        --remote) GIT_REMOTE="$2"; shift 2 ;;
        --skip-git) SKIP_GIT=true; shift ;;
        *) shift ;;
    esac
done

echo ""
echo "========================================"
echo "  🚀 SETUP_Detox — Hackathon Setup"
echo "========================================"
echo ""

# --- Step 1: Project Name ---
if [ -z "$PROJECT_NAME" ]; then
    read -p "📋 Enter your project/hackathon name: " PROJECT_NAME
fi
echo "✅ Project: $PROJECT_NAME"

# --- Step 2: Initialize Git ---
if [ "$SKIP_GIT" = false ]; then
    if [ ! -d "$ROOT/.git" ]; then
        echo "📦 Initializing Git repository..."
        git init "$ROOT"
        git -C "$ROOT" branch -M main
    else
        echo "✅ Git repository already exists."
    fi

    if [ -n "$GIT_REMOTE" ]; then
        existing=$(git -C "$ROOT" remote get-url origin 2>/dev/null || true)
        if [ -n "$existing" ]; then
            echo "🔗 Remote already set: $existing"
        else
            git -C "$ROOT" remote add origin "$GIT_REMOTE"
            echo "🔗 Remote set: $GIT_REMOTE"
        fi
    fi
fi

# --- Step 3: Ensure directory structure ---
for dir in ".hackathon/context" ".hackathon/parts" ".hackathon/assignments" ".hackathon/logs" ".hackathon/merged" "workspace"; do
    mkdir -p "$ROOT/$dir"
done
echo "✅ Directory structure verified."

# --- Step 4: Update config ---
CONFIG="$ROOT/.hackathon/assignments/registry.json"
TIMESTAMP=$(date -Iseconds 2>/dev/null || date +"%Y-%m-%dT%H:%M:%S%z")
# Use python if available for JSON manipulation, else sed
if command -v python3 &>/dev/null; then
    python3 -c "
import json, sys
with open('$CONFIG', 'r') as f:
    data = json.load(f)
data['project_name'] = '$PROJECT_NAME'
data['created_at'] = '$TIMESTAMP'
with open('$CONFIG', 'w') as f:
    json.dump(data, f, indent=2)
"
fi
echo "✅ Configuration updated."

# --- Step 5: Write initial log entry ---
LOG="$ROOT/.hackathon/logs/activity.jsonl"
echo "{\"timestamp\":\"$TIMESTAMP\",\"member\":\"$(whoami)\",\"part\":\"SETUP\",\"action\":\"Project initialized: $PROJECT_NAME\",\"prompt\":\"setup.sh executed\",\"files_changed\":[\"registry.json\",\"PLAN.md\"],\"type\":\"OTHER\"}" >> "$LOG"
echo "✅ Activity log initialized."

# --- Step 6: Create .gitignore ---
GITIGNORE="$ROOT/.gitignore"
if [ ! -f "$GITIGNORE" ]; then
    cat > "$GITIGNORE" << 'EOF'
# OS
.DS_Store
Thumbs.db
desktop.ini

# IDEs
.vscode/
.idea/
*.swp
*.swo

# Dependencies
node_modules/
__pycache__/
*.pyc
venv/
.env

# Build
dist/
build/
EOF
    echo "✅ .gitignore created."
fi

# --- Step 7: Check plan ---
PLAN="$ROOT/.hackathon/context/PLAN.md"
echo ""
echo "========================================"
echo "  ✅ SETUP COMPLETE!"
echo "========================================"
echo ""

if ! grep -qE '[A-Za-z0-9]{10,}' "$PLAN" 2>/dev/null; then
    echo "⚠️  NEXT STEP: Fill in your project plan!"
    echo "   Edit: .hackathon/context/PLAN.md"
    echo "   Then tell your AI agent: 'split'"
else
    echo "📋 Plan detected! Tell your AI agent: 'split'"
fi

echo ""
echo "📌 Quick Commands for AI Agent:"
echo "   setup  — Initialize project"
echo "   split  — Divide plan into parts"
echo "   claim part X — Claim a part"
echo "   status — Show all parts"
echo "   start  — Begin your part"
echo "   done   — Mark part complete"
echo "   check  — Pull latest updates"
echo "   merge  — Merge all parts"
echo "   log    — Show activity log"
echo ""

