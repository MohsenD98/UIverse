#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

build_dir="${1:-build}"
out_dir="docs/images"
tool="$build_dir/uiverse-snapshot"
[[ -f "$tool.exe" ]] && tool="$tool.exe"

export QT_ENABLE_HIGHDPI_SCALING=0
mkdir -p "$out_dir"

"$tool" --route gallery --size 1280x700 --out "$out_dir/gallery.png"

for dir in styles/*/; do
    pack="$(basename "$dir")"
    [[ "$pack" == "registry" ]] && continue
    "$tool" --pack "$pack" --size 1280x900 --out "$out_dir/$pack.png"
done
