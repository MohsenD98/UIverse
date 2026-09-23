#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"
source scripts/lib.sh

tool="$(snapshot_tool "${1:-build}")"
out_dir="docs/images"
mkdir -p "$out_dir"
export QT_ENABLE_HIGHDPI_SCALING=0

"$tool" --route gallery --size 1280x700 --out "$out_dir/gallery.png"

for pack in $(pack_keys); do
    "$tool" --pack "$pack" --size 1280x900 --out "$out_dir/$pack.png"
done
