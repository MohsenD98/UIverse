#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

build_dir="${1:-build}"
out_dir="${2:-snapshots}"
tool="$build_dir/uiverse-snapshot"
[[ -f "$tool.exe" ]] && tool="$tool.exe"

mkdir -p "$out_dir"

"$tool" --route gallery --size 1320x900 --out "$out_dir/gallery.png"

for dir in styles/*/; do
    pack="$(basename "$dir")"
    [[ "$pack" == "registry" ]] && continue
    "$tool" --pack "$pack" --size 1320x1700 --out "$out_dir/$pack.png"
    "$tool" --pack "$pack" --size 700x1400 --out "$out_dir/$pack-narrow.png"
done
