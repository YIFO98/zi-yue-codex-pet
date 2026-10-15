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

function Assert-FileHash {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Expected
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Required file is missing: $Path"
    }

    $Actual = (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($Actual -ne $Expected) {
        throw "SHA256 mismatch for $Path. Expected $Expected, got $Actual"
    }
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
$PackageRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$SourcePetDir = Join-Path (Join-Path $PackageRoot 'pet') 'yue-li'
$TargetPetDir = Join-Path (Join-Path $CodexHome 'pets') 'yue-li'

foreach ($Name in $ExpectedHashes.Keys) {
    Assert-FileHash -Path (Join-Path $SourcePetDir $Name) -Expected $ExpectedHashes[$Name]
}

$SourceManifest = Get-Content -LiteralPath (Join-Path $SourcePetDir 'pet.json') -Raw | ConvertFrom-Json
if ($SourceManifest.id -ne 'yue-li' -or
    $SourceManifest.spriteVersionNumber -ne 2 -or
    $SourceManifest.spritesheetPath -ne 'spritesheet.webp') {
    throw 'The packaged pet.json does not match the Yue Li R4 contract.'
}

$ExistingFiles = @()
foreach ($Name in $ExpectedHashes.Keys) {
    $Candidate = Join-Path $TargetPetDir $Name
    if (Test-Path -LiteralPath $Candidate -PathType Leaf) {
        $ExistingFiles += $Candidate
    }
}

if ($ExistingFiles.Count -gt 0) {
    $BackupRoot = Join-Path $CodexHome 'pet-backups'
    $BackupDir = Join-Path $BackupRoot ("yue-li-" + (Get-Date -Format 'yyyyMMdd-HHmmss-fff'))
    $null = New-Item -ItemType Directory -Path $BackupDir -Force
    foreach ($ExistingFile in $ExistingFiles) {
        Copy-Item -LiteralPath $ExistingFile -Destination (Join-Path $BackupDir (Split-Path -Leaf $ExistingFile)) -Force
    }
    Write-Host "[OK] Existing Yue Li files backed up to: $BackupDir"
}

$null = New-Item -ItemType Directory -Path $TargetPetDir -Force
foreach ($Name in $ExpectedHashes.Keys) {
    Copy-Item -LiteralPath (Join-Path $SourcePetDir $Name) -Destination (Join-Path $TargetPetDir $Name) -Force
    Assert-FileHash -Path (Join-Path $TargetPetDir $Name) -Expected $ExpectedHashes[$Name]
}

$InstalledManifest = Get-Content -LiteralPath (Join-Path $TargetPetDir 'pet.json') -Raw | ConvertFrom-Json
if ($InstalledManifest.id -ne 'yue-li' -or
    $InstalledManifest.spriteVersionNumber -ne 2 -or
    $InstalledManifest.spritesheetPath -ne 'spritesheet.webp') {
    throw 'Installed pet.json failed validation.'
}

Write-Host "[OK] Yue Li R4 installed to: $TargetPetDir"
Write-Host '[NEXT] Fully quit and reopen the Codex/ChatGPT desktop app.'
