#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"
source scripts/lib.sh

tool="$(snapshot_tool "${1:-build}")"
out_dir="${2:-snapshots}"
mkdir -p "$out_dir"

"$tool" --route gallery --size 1320x900 --out "$out_dir/gallery.png"

for pack in $(pack_keys); do
    "$tool" --pack "$pack" --size 1320x1700 --out "$out_dir/$pack.png"
    "$tool" --pack "$pack" --size 700x1400 --out "$out_dir/$pack-narrow.png"
    "$tool" --pack "$pack" --size 1320x900 --rules --out "$out_dir/$pack-rules.png"
done
