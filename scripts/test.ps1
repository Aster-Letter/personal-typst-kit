$ErrorActionPreference = 'Stop'
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$Build = Join-Path $Root 'build'
New-Item -ItemType Directory -Path $Build -Force | Out-Null

$Examples = @(
  'paper/main.typ',
  'working-paper/main.typ',
  'book/main.typ',
  'manual/main.typ',
  'handout/main.typ',
  'themes/teal.typ',
  'themes/ink.typ',
  'themes/warm.typ',
  'themes/blue.typ'
)

foreach ($Example in $Examples) {
  $Input = Join-Path $Root ('examples/' + $Example)
  $Name = ($Example -replace '[\\/]', '-') -replace '\.typ$', ''
  & typst compile --root $Root $Input (Join-Path $Build ($Name + '.pdf'))
  if ($LASTEXITCODE -ne 0) { throw "PDF compile failed: $Example" }
  & typst compile --root $Root --features html $Input (Join-Path $Build ($Name + '.html'))
  if ($LASTEXITCODE -ne 0) { throw "HTML compile failed: $Example" }
}

$Valid = @(
  'working-paper-inline.typ',
  'working-paper-title-page.typ',
  'working-paper-authors.typ',
  'working-paper-custom-theme.typ',
  'working-paper-spacing.typ',
  'working-paper-feedback.typ',
  'working-paper-front-pressure.typ'
)
foreach ($Fixture in $Valid) {
  $Input = Join-Path $Root ('tests/' + $Fixture)
  $Name = $Fixture -replace '\.typ$', ''
  & typst compile --root $Root $Input (Join-Path $Build ($Name + '.pdf'))
  if ($LASTEXITCODE -ne 0) { throw "PDF compile failed: $Fixture" }
  & typst compile --root $Root --features html $Input (Join-Path $Build ($Name + '.html'))
  if ($LASTEXITCODE -ne 0) { throw "HTML compile failed: $Fixture" }
}

$PackagePath = Join-Path $Build 'packages'
& (Join-Path $PSScriptRoot 'install-local.ps1') -DestinationRoot $PackagePath
& typst compile --package-path $PackagePath (Join-Path $Root 'tests/package-import.typ') (Join-Path $Build 'package-import.pdf')
if ($LASTEXITCODE -ne 0) { throw 'Local package import failed' }

$Invalid = @(
  'unknown-option.typ',
  'handout-title-style.typ',
  'bare-image-path.typ',
  'working-paper-front-matter.typ',
  'working-paper-authors-type.typ',
  'working-paper-author-name.typ',
  'working-paper-author-conflict.typ',
  'working-paper-english.typ',
  'working-paper-author-key.typ',
  'working-paper-old-toggle.typ',
  'working-paper-front-density.typ',
  'working-paper-extra-lines.typ',
  'code-block-breakable.typ'
)
foreach ($Fixture in $Invalid) {
  $ErrorActionPreference = 'Continue'
  & typst compile --root $Root (Join-Path $Root ('tests/invalid/' + $Fixture)) (Join-Path $Build 'invalid.pdf') 2>$null
  $ExitCode = $LASTEXITCODE
  $ErrorActionPreference = 'Stop'
  if ($ExitCode -eq 0) { throw "Expected compile failure: $Fixture" }
}

Write-Output 'All personal-typst-kit tests passed.'
$global:LASTEXITCODE = 0
