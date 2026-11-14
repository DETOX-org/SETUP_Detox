#!/usr/bin/env pwsh
# Sync — Pull latest, show changes, and check for conflicts
param([string]$Root = (Split-Path $PSScriptRoot))

Write-Host ""
Write-Host "🔄 Syncing with GitHub..." -ForegroundColor Cyan

Set-Location $Root

# Check if remote exists
$remote = git remote get-url origin 2>$null
if (-not $remote) {
    Write-Host "⚠️  No remote configured. Add one with:" -ForegroundColor Yellow
    Write-Host "   git remote add origin https://github.com/YOUR/REPO.git" -ForegroundColor White
    exit 1
}

# Stash local changes
$hasChanges = git status --porcelain
if ($hasChanges) {
    Write-Host "📦 Stashing local changes..." -ForegroundColor Yellow
    git stash push -m "SETUP_Detox auto-stash $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
}

# Pull
Write-Host "⬇️  Pulling latest..." -ForegroundColor Cyan
$pullResult = git pull origin main 2>&1
Write-Host $pullResult

# Pop stash if we stashed
if ($hasChanges) {
    Write-Host "📦 Restoring local changes..." -ForegroundColor Yellow
    $stashResult = git stash pop 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "⚠️  Merge conflict during stash pop!" -ForegroundColor Red
        Write-Host $stashResult
        Write-Host "   Resolve conflicts manually, then run: git stash drop" -ForegroundColor Yellow
    }
}

# Show current registry status
& "$Root\scripts\status.ps1"

