#!/usr/bin/env bash
set -uo pipefail

build_dir="${1:-build}"
log="$(mktemp)"

cmake --build "$build_dir" --target all_qmllint 2>&1 | tee "$log"
status="${PIPESTATUS[0]}"

if grep -qE '^(Warning|Error|Info):' "$log"; then
    echo "qmllint reported findings" >&2
    exit 1
fi

exit "$status"
