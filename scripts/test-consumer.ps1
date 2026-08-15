param(
  [Parameter(Mandatory = $true)]
  [string]$ConsumerRoot,

  [Parameter(Mandatory = $true)]
  [string]$Entry,

  [string]$Output = (Join-Path ([System.IO.Path]::GetTempPath()) 'personal-typst-kit-consumer-smoke.pdf'),

  [string]$PackagePath = (Join-Path ([System.IO.Path]::GetTempPath()) 'personal-typst-kit-consumer-packages')
)

$ErrorActionPreference = 'Stop'
$KitRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$ConsumerRoot = (Resolve-Path -LiteralPath $ConsumerRoot).Path
$EntryCandidate = if ([System.IO.Path]::IsPathRooted($Entry)) {
  $Entry
} else {
  Join-Path $ConsumerRoot $Entry
}
$EntryPath = (Resolve-Path -LiteralPath $EntryCandidate).Path
$ConsumerPrefix = $ConsumerRoot.TrimEnd(
  [System.IO.Path]::DirectorySeparatorChar,
  [System.IO.Path]::AltDirectorySeparatorChar
) + [System.IO.Path]::DirectorySeparatorChar

if ($EntryPath -ne $ConsumerRoot -and -not $EntryPath.StartsWith($ConsumerPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
  throw 'Entry must resolve inside ConsumerRoot'
}

$Output = [System.IO.Path]::GetFullPath($Output)
$PackagePath = [System.IO.Path]::GetFullPath($PackagePath)
$OutputDirectory = Split-Path -Parent $Output
New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
New-Item -ItemType Directory -Path $PackagePath -Force | Out-Null

& (Join-Path $KitRoot 'scripts\install-local.ps1') -DestinationRoot $PackagePath
if ($LASTEXITCODE -ne 0) { throw 'Temporary package installation failed' }

& typst compile --package-path $PackagePath --root $ConsumerRoot $EntryPath $Output
if ($LASTEXITCODE -ne 0) { throw 'Consumer smoke compile failed' }

Write-Output "Consumer smoke test passed: $Output"
$global:LASTEXITCODE = 0
