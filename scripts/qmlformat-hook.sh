#!/usr/bin/env bash
set -euo pipefail

qmlformat="$("$(dirname "$0")/find-qmlformat.sh")"
"$qmlformat" -i "$@"
