#!/usr/bin/env pwsh
# Quick Status Check — Shows all parts and their assignments
param([string]$Root = (Split-Path $PSScriptRoot))

$registryPath = Join-Path $Root ".hackathon\assignments\registry.json"
if (-not (Test-Path $registryPath)) {
    Write-Host "❌ No registry found. Run setup.ps1 first." -ForegroundColor Red
    exit 1
}

$registry = Get-Content $registryPath -Raw | ConvertFrom-Json

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  📊 $($registry.project_name) — Status" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

if ($registry.parts.Count -eq 0) {
    Write-Host "  No parts created yet. Tell AI agent: 'split'" -ForegroundColor Yellow
    exit 0
}

$unclaimed = 0
$claimed = 0
$completed = 0

foreach ($part in $registry.parts) {
    switch ($part.status) {
        "UNCLAIMED" {
            $icon = "🔴"
            $color = "Red"
            $unclaimed++
        }
        "CLAIMED" {
            $icon = "🟡"
            $color = "Yellow"
            $claimed++
        }
        "IN_PROGRESS" {
            $icon = "🔵"
            $color = "Blue"
            $claimed++
        }
        "COMPLETED" {
            $icon = "🟢"
            $color = "Green"
            $completed++
        }
        default {
            $icon = "⚪"
            $color = "White"
        }
    }

    Write-Host "  $icon Part $($part.part_number): $($part.title)" -ForegroundColor $color
    if ($part.assigned_to) {
        Write-Host "     └─ Assigned to: $($part.assigned_to) | Since: $($part.claimed_at)" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "  ─────────────────────────────────" -ForegroundColor DarkGray
Write-Host "  Total: $($registry.parts.Count) | 🔴 $unclaimed unclaimed | 🟡 $claimed active | 🟢 $completed done" -ForegroundColor White
Write-Host ""

