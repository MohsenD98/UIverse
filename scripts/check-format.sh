#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

qmlformat="${QMLFORMAT:-qmlformat}"
status=0

while IFS= read -r file; do
    if [[ "${1:-}" == "--fix" ]]; then
        "$qmlformat" -i "$file"
    elif ! "$qmlformat" "$file" | tr -d '\r' | diff -u --label "$file" --label "$file (qmlformat)" "$file" -; then
        status=1
    fi
done < <(git ls-files '*.qml')

exit "$status"
