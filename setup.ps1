#!/usr/bin/env pwsh
# ============================================================
# SETUP_Detox — One-Command Hackathon Project Setup (Windows)
# ============================================================
# Usage: .\setup.ps1 [-ProjectName "MyHackathon"] [-GitRemote "https://github.com/..."]
# ============================================================

param(
    [string]$ProjectName = "",
    [string]$GitRemote = "",
    [switch]$SkipGit
)

$ErrorActionPreference = "Stop"
$Root = $PSScriptRoot

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  🚀 SETUP_Detox — Hackathon Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# --- Step 1: Project Name ---
if (-not $ProjectName) {
    $ProjectName = Read-Host "📋 Enter your project/hackathon name"
}
Write-Host "✅ Project: $ProjectName" -ForegroundColor Green

# --- Step 2: Initialize Git ---
if (-not $SkipGit) {
    if (-not (Test-Path "$Root\.git")) {
        Write-Host "📦 Initializing Git repository..." -ForegroundColor Yellow
        git init $Root
        git -C $Root branch -M main
    } else {
        Write-Host "✅ Git repository already exists." -ForegroundColor Green
    }

    if ($GitRemote) {
        $existingRemote = git -C $Root remote get-url origin 2>$null
        if ($existingRemote) {
            Write-Host "🔗 Remote already set: $existingRemote" -ForegroundColor Yellow
        } else {
            git -C $Root remote add origin $GitRemote
            Write-Host "🔗 Remote set: $GitRemote" -ForegroundColor Green
        }
    }
}

# --- Step 3: Ensure directory structure ---
$dirs = @(
    ".hackathon\context",
    ".hackathon\parts",
    ".hackathon\assignments",
    ".hackathon\logs",
    ".hackathon\merged",
    "workspace"
)
foreach ($d in $dirs) {
    $fullPath = Join-Path $Root $d
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
    }
}
Write-Host "✅ Directory structure verified." -ForegroundColor Green

# --- Step 4: Update config ---
$configPath = Join-Path $Root ".hackathon\assignments\registry.json"
$config = Get-Content $configPath -Raw | ConvertFrom-Json
$config.project_name = $ProjectName
$config.created_at = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssK")
$config | ConvertTo-Json -Depth 10 | Set-Content $configPath -Encoding UTF8
Write-Host "✅ Configuration updated." -ForegroundColor Green

# --- Step 5: Write initial log entry ---
$logPath = Join-Path $Root ".hackathon\logs\activity.jsonl"
$logEntry = @{
    timestamp = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssK")
    member = $env:USERNAME
    part = "SETUP"
    action = "Project initialized: $ProjectName"
    prompt = "setup.ps1 executed"
    files_changed = @("registry.json", "PLAN.md")
    type = "OTHER"
} | ConvertTo-Json -Compress
Add-Content -Path $logPath -Value $logEntry -Encoding UTF8
Write-Host "✅ Activity log initialized." -ForegroundColor Green

# --- Step 6: Create .gitignore if not exists ---
$gitignorePath = Join-Path $Root ".gitignore"
if (-not (Test-Path $gitignorePath)) {
    @"
# OS
.DS_Store
Thumbs.db
desktop.ini

# IDEs
.vscode/
.idea/
*.swp
*.swo

# Dependencies (add your own)
node_modules/
__pycache__/
*.pyc
venv/
.env

# Build
dist/
build/
*.exe
*.dll
"@ | Set-Content $gitignorePath -Encoding UTF8
    Write-Host "✅ .gitignore created." -ForegroundColor Green
}

# --- Step 7: Check if PLAN.md has content ---
$planPath = Join-Path $Root ".hackathon\context\PLAN.md"
$planContent = Get-Content $planPath -Raw
$hasContent = $planContent -match "[A-Za-z0-9]{10,}"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  ✅ SETUP COMPLETE!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

if (-not $hasContent) {
    Write-Host "⚠️  NEXT STEP: Fill in your project plan!" -ForegroundColor Yellow
    Write-Host "   Edit: .hackathon\context\PLAN.md" -ForegroundColor Yellow
    Write-Host "   Then tell your AI agent: 'split'" -ForegroundColor Yellow
} else {
    Write-Host "📋 Plan detected! Tell your AI agent: 'split'" -ForegroundColor Green
}

Write-Host ""
Write-Host "📌 Quick Commands for AI Agent:" -ForegroundColor Magenta
Write-Host "   setup  — Initialize project" -ForegroundColor White
Write-Host "   split  — Divide plan into parts" -ForegroundColor White
Write-Host "   claim part X — Claim a part" -ForegroundColor White
Write-Host "   status — Show all parts" -ForegroundColor White
Write-Host "   start  — Begin your part" -ForegroundColor White
Write-Host "   done   — Mark part complete" -ForegroundColor White
Write-Host "   check  — Pull latest updates" -ForegroundColor White
Write-Host "   merge  — Merge all parts" -ForegroundColor White
Write-Host "   log    — Show activity log" -ForegroundColor White
Write-Host ""

if (-not $SkipGit -and -not $GitRemote) {
    Write-Host "💡 TIP: Add a GitHub remote with:" -ForegroundColor Yellow
    Write-Host "   git remote add origin https://github.com/YOUR_USER/YOUR_REPO.git" -ForegroundColor White
    Write-Host ""
}

