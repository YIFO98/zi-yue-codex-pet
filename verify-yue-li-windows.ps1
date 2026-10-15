[CmdletBinding()]
param(
    [string]$CodexHome
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ExpectedHashes = @{
    'pet.json'        = '7d861a8ff747b3b8024704df48f59ab1ed81e1848fde7ccc1f12a124bfa2efdd'
    'spritesheet.webp' = '695315d95d6fc8f4a5df2560b02cd93e07372c3904e7aaa97c55a1ca78014ff6'
}

if ([string]::IsNullOrWhiteSpace($CodexHome)) {
    if (-not [string]::IsNullOrWhiteSpace($env:CODEX_HOME)) {
        $CodexHome = $env:CODEX_HOME
    }
    else {
        $CodexHome = Join-Path $HOME '.codex'
    }
}

$CodexHome = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($CodexHome)
$TargetPetDir = Join-Path (Join-Path $CodexHome 'pets') 'yue-li'

foreach ($Name in $ExpectedHashes.Keys) {
    $Path = Join-Path $TargetPetDir $Name
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Installed file is missing: $Path"
    }

    $Actual = (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($Actual -ne $ExpectedHashes[$Name]) {
        throw "SHA256 mismatch for $Path. Expected $($ExpectedHashes[$Name]), got $Actual"
    }
    Write-Host "[OK] $Name SHA256 $Actual"
}

$Manifest = Get-Content -LiteralPath (Join-Path $TargetPetDir 'pet.json') -Raw | ConvertFrom-Json
if ($Manifest.id -ne 'yue-li') {
    throw "Unexpected pet id: $($Manifest.id)"
}
if ($Manifest.spriteVersionNumber -ne 2) {
    throw "Unexpected spriteVersionNumber: $($Manifest.spriteVersionNumber)"
}
if ($Manifest.spritesheetPath -ne 'spritesheet.webp') {
    throw "Unexpected spritesheetPath: $($Manifest.spritesheetPath)"
}

Write-Host "[PASS] Yue Li R7 is installed correctly at: $TargetPetDir"
