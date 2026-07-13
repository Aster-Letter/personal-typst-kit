#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${1:-$ROOT/build/fonts}"
mkdir -p "$DEST"
curl -L --fail --output "$DEST/NotoSerifSC[wght].ttf" 'https://github.com/google/fonts/raw/main/ofl/notoserifsc/NotoSerifSC%5Bwght%5D.ttf'
curl -L --fail --output "$DEST/NotoSansSC[wght].ttf" 'https://github.com/google/fonts/raw/main/ofl/notosanssc/NotoSansSC%5Bwght%5D.ttf'
curl -L --fail --output "$DEST/JetBrainsMono[wght].ttf" 'https://github.com/google/fonts/raw/main/ofl/jetbrainsmono/JetBrainsMono%5Bwght%5D.ttf'
printf 'Fetched OFL fonts to %s\n' "$DEST"
