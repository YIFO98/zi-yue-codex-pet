[CmdletBinding()]
param(
    [string]$CodexHome
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ExpectedHashes = @{
    'pet.json'        = '23486333eef37b15500ecba695b553349bc503cb30d1a4055c3d56cff1b95770'
    'spritesheet.webp' = '78f8a8fb0a3e3f464bd485079cb123f574c3c63dc0754d8fd11143c58816ba15'
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
$TargetPetDir = Join-Path (Join-Path $CodexHome 'pets') 'zi-yue'

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
if ($Manifest.id -ne 'zi-yue') {
    throw "Unexpected pet id: $($Manifest.id)"
}
if ($Manifest.spriteVersionNumber -ne 2) {
    throw "Unexpected spriteVersionNumber: $($Manifest.spriteVersionNumber)"
}
if ($Manifest.spritesheetPath -ne 'spritesheet.webp') {
    throw "Unexpected spritesheetPath: $($Manifest.spritesheetPath)"
}

Write-Host "[PASS] Zi Yue v2 is installed correctly at: $TargetPetDir"

