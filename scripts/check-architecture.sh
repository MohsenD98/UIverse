#!/usr/bin/env bash
set -uo pipefail

cd "$(git rev-parse --show-toplevel)"

max_lines=800
max_response_ms=400
status=0

report() {
    echo "$1" >&2
    status=1
}

files=("$@")
if (( ${#files[@]} == 0 )); then
    mapfile -t files < <(git ls-files '*.qml')
fi

for file in "${files[@]}"; do
    [[ "$file" == *.qml && -f "$file" ]] || continue

    lines=$(wc -l < "$file")
    (( lines <= max_lines )) || report "$file: $lines lines, the ceiling is $max_lines (rule 6)"

    grep -nE '^\s*/\*' "$file" | sed "s|^|$file:|;s|$| block comment (rule 5)|" >&2 && status=1
    awk -v f="$file" '/^[[:space:]]*\/\// { if (prev) { print f ":" NR ": consecutive comment lines (rule 5)"; bad=1 } prev=1; next } { prev=0 } END { exit bad }' "$file" >&2 || status=1

    awk -v f="$file" -v max="$max_response_ms" '/^[[:space:]]*duration(Fast|Base):[[:space:]]*[0-9]+/ { if ($2 + 0 > max) { print f ":" NR ": " $2 " ms response, the limit is " max " (Doherty threshold)"; bad=1 } } END { exit bad }' "$file" >&2 || status=1

    grep -nE '^\s*import\s+QtQuick\.Controls' "$file" | sed "s|^|$file:|;s|$| (rule 9: use QtQuick.Templates)|" >&2 && status=1

    if [[ "$file" == kit/* || "$file" == apps/* || ( "$file" == shell/* && "$file" != shell/ShellTheme.qml ) ]]; then
        grep -nE '"#[0-9a-fA-F]{3,8}"' "$file" | sed "s|^|$file:|;s|$| hardcoded colour (rule 7)|" >&2 && status=1
    fi

    if [[ "$file" =~ ^styles/([^/]+)/ && "${BASH_REMATCH[1]}" != registry ]]; then
        own="${BASH_REMATCH[1]}"
        grep -nE '^\s*import\s+UIverse\.Styles(\.|\s|$)' "$file" | grep -viE "UIverse\.Styles\.$own(\s|$)" \
            | sed "s|^|$file:|;s|$| (rule 10: styles must not import each other)|" >&2 && status=1
    fi
done

exit "$status"
