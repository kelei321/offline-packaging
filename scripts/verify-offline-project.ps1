$ErrorActionPreference = "Stop"
$RootDir = Resolve-Path (Join-Path $PSScriptRoot "..")
$AppId = "__UNI__BB37161"
$Status = 0

function Check($Message, $ScriptBlock) {
  try {
    if (& $ScriptBlock) {
      Write-Host "[OK] $Message"
    } else {
      Write-Host "[FAIL] $Message"
      $script:Status = 1
    }
  } catch {
    Write-Host "[FAIL] $Message"
    $script:Status = 1
  }
}

$AppBuild = Join-Path $RootDir "app/build.gradle.kts"
$RootBuild = Join-Path $RootDir "build.gradle.kts"
$LibDir = Join-Path $RootDir "app/libs"
$WwwDir = Join-Path $RootDir "app/src/main/assets/apps/$AppId/www"
$ControlXml = Join-Path $RootDir "app/src/main/assets/data/dcloud_control.xml"

Check "compileSdk = 35" { (Get-Content $AppBuild -Raw) -match 'compileSdk = 35' }
Check "buildToolsVersion = 35.0.0" { (Get-Content $AppBuild -Raw) -match 'buildToolsVersion = "35.0.0"' }
Check "AGP = 8.7.3" { (Get-Content $RootBuild -Raw) -match '8.7.3' }
Check "Kotlin = 1.9.10" { (Get-Content $RootBuild -Raw) -match '1.9.10' }
Check "appid control xml" { (Get-Content $ControlXml -Raw) -match $AppId }
Check "official SDK AAR/JAR exists" { (Get-ChildItem $LibDir -File -Include *.aar, *.jar -ErrorAction SilentlyContinue).Count -gt 0 }
Check "HBuilderX www resources copied" { (Get-ChildItem $WwwDir -Force | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne ".gitkeep" }).Count -gt 0 }

exit $Status
