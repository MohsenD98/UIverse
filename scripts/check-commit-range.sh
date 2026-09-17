#!/usr/bin/env bash
set -euo pipefail

range="$1"
checker="$(dirname "$0")/check-commit-msg.sh"
message="$(mktemp)"
status=0

for sha in $(git rev-list --no-merges "$range"); do
    git log -1 --format=%B "$sha" > "$message"
    if ! "$checker" "$message"; then
        echo "  commit: $sha" >&2
        status=1
    fi
done

exit "$status"
