$ErrorActionPreference = 'Stop'
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$Review = Join-Path $Root 'tmp\review'
New-Item -ItemType Directory -Path $Review -Force | Out-Null

$Examples = @('paper', 'working-paper', 'book', 'manual', 'handout')
foreach ($Name in $Examples) {
  $Input = Join-Path $Root ("examples/$Name/main.typ")
  $Output = Join-Path $Review ($Name + '-{p}.png')
  & typst compile --root $Root $Input $Output --ppi 120
  if ($LASTEXITCODE -ne 0) { throw "Review render failed: $Name" }
}
Write-Output "Rendered review pages to $Review"
