#!/usr/bin/env pwsh
# View Activity Log — Show who did what and when
param(
    [string]$Root = (Split-Path $PSScriptRoot),
    [int]$Last = 20,
    [string]$Member = "",
    [string]$Part = ""
)

$logPath = Join-Path $Root ".hackathon\logs\activity.jsonl"
if (-not (Test-Path $logPath)) {
    Write-Host "❌ No activity log found." -ForegroundColor Red
    exit 1
}

$entries = Get-Content $logPath | Where-Object { $_.Trim() } | ForEach-Object {
    $_ | ConvertFrom-Json
}

# Filter
if ($Member) {
    $entries = $entries | Where-Object { $_.member -eq $Member }
}
if ($Part) {
    $entries = $entries | Where-Object { $_.part -eq $Part }
}

# Take last N
$entries = $entries | Select-Object -Last $Last

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  📜 Activity Log (last $Last entries)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

foreach ($e in $entries) {
    $typeColor = switch ($e.type) {
        "CLAIM"  { "Yellow" }
        "CODE"   { "Blue" }
        "MERGE"  { "Green" }
        "SPLIT"  { "Magenta" }
        "REVIEW" { "Cyan" }
        default  { "White" }
    }

    Write-Host "  [$($e.timestamp)] " -NoNewline -ForegroundColor DarkGray
    Write-Host "$($e.type) " -NoNewline -ForegroundColor $typeColor
    Write-Host "| $($e.member) | Part: $($e.part)" -ForegroundColor White
    Write-Host "    Action: $($e.action)" -ForegroundColor Gray
    if ($e.prompt) {
        Write-Host "    Prompt: $($e.prompt)" -ForegroundColor DarkGray
    }
    Write-Host ""
}

