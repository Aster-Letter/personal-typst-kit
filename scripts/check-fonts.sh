#!/usr/bin/env bash
set -euo pipefail
typst fonts | grep -E 'Source Han Serif SC|Source Han Sans SC|Noto Serif (CJK )?SC|Noto Sans (CJK )?SC|JetBrains Mono|DejaVu Sans Mono' || true
