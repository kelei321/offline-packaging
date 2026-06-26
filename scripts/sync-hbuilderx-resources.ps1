param([Parameter(Mandatory = $true)][string]$ExportDir)
$Script = Join-Path $PSScriptRoot "sync-hbuilderx-android-export.ps1"
& $Script $ExportDir
exit $LASTEXITCODE
