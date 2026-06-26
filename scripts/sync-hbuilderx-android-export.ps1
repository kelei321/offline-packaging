param([Parameter(Mandatory = $true)][string]$ExportDir)
$ErrorActionPreference = "Stop"

$AppId = "__UNI__BB37161"
$RootDir = Resolve-Path (Join-Path $PSScriptRoot "..")

if (-not (Test-Path $ExportDir)) {
  throw "Export directory not found: $ExportDir"
}

function Copy-DirIfExists($Source, $Target) {
  if (Test-Path $Source) {
    New-Item -ItemType Directory -Force -Path $Target | Out-Null
    Get-ChildItem -Path $Target -Force -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne ".gitkeep" } | Remove-Item -Recurse -Force
    Copy-Item -Path (Join-Path $Source "*") -Destination $Target -Recurse -Force
    Write-Host "[OK] $Source -> $Target"
  } else {
    Write-Host "[SKIP] $Source"
  }
}

function Copy-ManifestIfExists($Source, $Target) {
  if (Test-Path $Source) {
    New-Item -ItemType Directory -Force -Path (Split-Path $Target) | Out-Null
    $Content = Get-Content $Source -Raw
    $Content = $Content -replace '\s+package="[^"]+"', ''
    Set-Content -Path $Target -Value $Content -Encoding UTF8
    Write-Host "[OK] $Source -> $Target"
  } else {
    Write-Host "[SKIP] $Source"
  }
}

function Sync-Plugin($Plugin, $Module) {
  $Source = Join-Path $ExportDir "uni_modules/$Plugin"
  $Target = Join-Path $RootDir $Module

  if (-not (Test-Path $Source)) {
    Write-Host "[SKIP] $Plugin"
    return
  }

  Copy-ManifestIfExists (Join-Path $Source "AndroidManifest.xml") (Join-Path $Target "src/main/AndroidManifest.xml")
  Copy-DirIfExists (Join-Path $Source "src") (Join-Path $Target "src/main/java")
  Copy-DirIfExists (Join-Path $Source "res") (Join-Path $Target "src/main/res")
  Copy-DirIfExists (Join-Path $Source "assets") (Join-Path $Target "src/main/assets")
  Copy-DirIfExists (Join-Path $Source "libs") (Join-Path $Target "libs")
}

Copy-DirIfExists (Join-Path $ExportDir "uniappx/app-android/src") (Join-Path $RootDir "uniappx/src/main/java")
Copy-DirIfExists (Join-Path $ExportDir "uniappx/app-android/res") (Join-Path $RootDir "uniappx/src/main/res")
Copy-DirIfExists (Join-Path $ExportDir "uniappx/app-android/assets") (Join-Path $RootDir "uniappx/src/main/assets")
Copy-DirIfExists (Join-Path $ExportDir "apps/$AppId") (Join-Path $RootDir "uniappx/src/main/assets/apps/$AppId")

Sync-Plugin "firstui-uvue" "uts-firstui-uvue"
Sync-Plugin "kux-mlkit-scancode" "uts-kux-mlkit-scancode"
Sync-Plugin "kux-request" "uts-kux-request"
Sync-Plugin "kux-request-lite" "uts-kux-request-lite"
Sync-Plugin "kux-request-interceptors" "uts-kux-request-interceptors"
Sync-Plugin "uni-installApk" "uts-uni-installApk"
Sync-Plugin "unix-ui" "uts-unix-ui"
Sync-Plugin "uts-openSchema" "uts-uts-openSchema"
Sync-Plugin "z-paging-x" "uts-z-paging-x"

Write-Host "Synced HBuilderX Android export."
