#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKAGE_ROOT="${1:-${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages}"
DEST="$PACKAGE_ROOT/local/personal-typst-kit/0.1.0"

rm -rf "$DEST"
mkdir -p "$DEST"
cp "$ROOT/lib.typ" "$ROOT/typst.toml" "$ROOT/LICENSE" "$DEST/"
cp -R "$ROOT/src" "$DEST/"
printf 'Installed @local/personal-typst-kit:0.1.0 to %s\n' "$DEST"
