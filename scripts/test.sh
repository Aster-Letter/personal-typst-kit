#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD="$ROOT/build"
mkdir -p "$BUILD"

examples=(paper/main.typ working-paper/main.typ book/main.typ manual/main.typ handout/main.typ themes/teal.typ themes/ink.typ themes/warm.typ themes/blue.typ)
for example in "${examples[@]}"; do
  name="${example//\//-}"
  name="${name%.typ}"
  typst compile --root "$ROOT" "$ROOT/examples/$example" "$BUILD/$name.pdf"
  typst compile --root "$ROOT" --features html "$ROOT/examples/$example" "$BUILD/$name.html"
done

valid=(working-paper-inline.typ working-paper-title-page.typ working-paper-authors.typ working-paper-custom-theme.typ working-paper-spacing.typ working-paper-feedback.typ working-paper-front-pressure.typ)
for fixture in "${valid[@]}"; do
  name="${fixture%.typ}"
  typst compile --root "$ROOT" "$ROOT/tests/$fixture" "$BUILD/$name.pdf"
  typst compile --root "$ROOT" --features html "$ROOT/tests/$fixture" "$BUILD/$name.html"
done

PACKAGE_PATH="$BUILD/packages"
bash "$ROOT/scripts/install-local.sh" "$PACKAGE_PATH"
typst compile --package-path "$PACKAGE_PATH" "$ROOT/tests/package-import.typ" "$BUILD/package-import.pdf"

for fixture in \
  unknown-option.typ \
  bare-image-path.typ \
  working-paper-front-matter.typ \
  working-paper-authors-type.typ \
  working-paper-author-name.typ \
  working-paper-author-conflict.typ \
  working-paper-english.typ \
  working-paper-author-key.typ \
  working-paper-old-toggle.typ \
  working-paper-front-density.typ \
  working-paper-extra-lines.typ \
  code-block-breakable.typ; do
  if typst compile --root "$ROOT" "$ROOT/tests/invalid/$fixture" "$BUILD/invalid.pdf" >/dev/null 2>&1; then
    printf 'Expected compile failure: %s\n' "$fixture" >&2
    exit 1
  fi
done

printf 'All personal-typst-kit tests passed.\n'
