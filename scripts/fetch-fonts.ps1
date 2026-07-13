param(
  [string]$Destination = (Join-Path $PSScriptRoot '..\build\fonts')
)

$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Path $Destination -Force | Out-Null
$Fonts = @{
  'NotoSerifSC[wght].ttf' = 'https://github.com/google/fonts/raw/main/ofl/notoserifsc/NotoSerifSC%5Bwght%5D.ttf'
  'NotoSansSC[wght].ttf' = 'https://github.com/google/fonts/raw/main/ofl/notosanssc/NotoSansSC%5Bwght%5D.ttf'
  'JetBrainsMono[wght].ttf' = 'https://github.com/google/fonts/raw/main/ofl/jetbrainsmono/JetBrainsMono%5Bwght%5D.ttf'
}
foreach ($Entry in $Fonts.GetEnumerator()) {
  $Target = Join-Path $Destination $Entry.Key
  if (-not (Test-Path -LiteralPath $Target)) {
    Invoke-WebRequest -Uri $Entry.Value -OutFile $Target
  }
}
Write-Output "Fetched OFL fonts to $([System.IO.Path]::GetFullPath($Destination))"
