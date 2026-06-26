param([Parameter(Mandatory = $true)][string]$ResourceDir)
$ErrorActionPreference = "Stop"
$AppId = "__UNI__BB37161"
$RootDir = Resolve-Path (Join-Path $PSScriptRoot "..")
$TargetDir = Join-Path $RootDir "app/src/main/assets/apps/$AppId/www"
if (-not (Test-Path $ResourceDir)) { throw "Resource directory not found: $ResourceDir" }
$SourceWww = Join-Path $ResourceDir "www"
if (-not (Test-Path $SourceWww)) { $SourceWww = $ResourceDir }
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Get-ChildItem -Path $TargetDir -Force | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne ".gitkeep" } | Remove-Item -Recurse -Force
Copy-Item -Path (Join-Path $SourceWww "*") -Destination $TargetDir -Recurse -Force
Write-Host "Synced HBuilderX resources to $TargetDir"
