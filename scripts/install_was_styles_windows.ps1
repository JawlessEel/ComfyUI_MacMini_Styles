$ErrorActionPreference = "Stop"

$ComfyDir = "C:\AI_PROJECTS\ComfyUI_CLEAN"
$RepoDir = Split-Path -Parent $PSScriptRoot

$WasDir = Join-Path $ComfyDir "custom_nodes\was-ns"

if (!(Test-Path $WasDir)) {
    throw "WAS node folder not found at: $WasDir"
}

$TargetStyles = Join-Path $WasDir "styles.csv"
$TargetFooocus = Join-Path $WasDir "fooocus_styles_for_was.csv"

if (Test-Path $TargetStyles) {
    $Stamp = Get-Date -Format "yyyyMMdd_HHmmss"
    Copy-Item $TargetStyles "$TargetStyles.bak.$Stamp"
}

Copy-Item (Join-Path $RepoDir "was-ns\styles\styles.csv") $TargetStyles -Force
Copy-Item (Join-Path $RepoDir "was-ns\styles\fooocus_styles_for_was.csv") $TargetFooocus -Force

Write-Host "Installed WAS Fooocus styles to:"
Write-Host $TargetStyles
