[CmdletBinding()]
param(
    [string]$CodexHome
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ExpectedHashes = @{
    'pet.json'        = 'a522b34b29a78516457b8bcc6675ed65912f99e76ec4a02298105d35422bcffe'
    'spritesheet.webp' = 'f5b41c2b07544ded1b63ac4867cf3d8143f84fb3e6f409ceeafdd3630f7cbb19'
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

Write-Host "[PASS] Yue Li R4 is installed correctly at: $TargetPetDir"
