$ErrorActionPreference = "Stop"
$RootDir = Resolve-Path (Join-Path $PSScriptRoot "..")
$AppId = "__UNI__BB37161"
$AppBuild = Join-Path $RootDir "app/build.gradle.kts"
$RootBuild = Join-Path $RootDir "build.gradle.kts"
$LibDir = Join-Path $RootDir "app/libs"
$WwwDir = Join-Path $RootDir "app/src/main/assets/apps/$AppId/www"
$ControlXml = Join-Path $RootDir "app/src/main/assets/data/dcloud_control.xml"
Write-Host ((Get-Content $AppBuild -Raw) -match 'compileSdk = 35' ? '[OK] compileSdk = 35' : '[FAIL] compileSdk = 35')
Write-Host ((Get-Content $AppBuild -Raw) -match 'buildToolsVersion = "35.0.0"' ? '[OK] buildToolsVersion = 35.0.0' : '[FAIL] buildToolsVersion = 35.0.0')
Write-Host ((Get-Content $RootBuild -Raw) -match '8.7.3' ? '[OK] AGP = 8.7.3' : '[FAIL] AGP = 8.7.3')
Write-Host ((Get-Content $RootBuild -Raw) -match '1.9.10' ? '[OK] Kotlin = 1.9.10' : '[FAIL] Kotlin = 1.9.10')
Write-Host ((Get-Content $ControlXml -Raw) -match $AppId ? '[OK] appid control xml' : '[FAIL] appid control xml')
Write-Host ((Get-ChildItem $LibDir -File -Include *.aar, *.jar -ErrorAction SilentlyContinue).Count -gt 0 ? '[OK] official SDK AAR/JAR exists' : '[FAIL] official SDK AAR/JAR exists')
Write-Host ((Get-ChildItem $WwwDir -Force | Where-Object { $_.Name -ne 'README.md' -and $_.Name -ne '.gitkeep' }).Count -gt 0 ? '[OK] HBuilderX www resources copied' : '[FAIL] HBuilderX www resources copied')
