param(
  [string]$DestinationRoot = (Join-Path $env:APPDATA 'typst\packages')
)

$ErrorActionPreference = 'Stop'
$PackageRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$DestinationRoot = [System.IO.Path]::GetFullPath($DestinationRoot)
$Destination = Join-Path $DestinationRoot 'local\personal-typst-kit\0.2.2'

if (Test-Path -LiteralPath $Destination) {
  Remove-Item -LiteralPath $Destination -Recurse -Force
}
New-Item -ItemType Directory -Path $Destination -Force | Out-Null

Copy-Item -LiteralPath (Join-Path $PackageRoot 'lib.typ') -Destination $Destination
Copy-Item -LiteralPath (Join-Path $PackageRoot 'typst.toml') -Destination $Destination
Copy-Item -LiteralPath (Join-Path $PackageRoot 'LICENSE') -Destination $Destination
Copy-Item -LiteralPath (Join-Path $PackageRoot 'src') -Destination $Destination -Recurse

Write-Output "Installed @local/personal-typst-kit:0.2.2 to $Destination"
$global:LASTEXITCODE = 0
