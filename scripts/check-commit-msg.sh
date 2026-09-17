#!/usr/bin/env bash
set -euo pipefail

max_title=60
message="$(sed '/^#/d' "$1")"
title="$(printf '%s\n' "$message" | head -n1)"

fail() {
    echo "commit message: $1" >&2
    echo "  title: $title" >&2
    exit 1
}

[[ -n "$title" ]] || fail "title is empty"
(( ${#title} <= max_title )) || fail "title is ${#title} characters; the limit is $max_title"
[[ "$title" != *. ]] || fail "title must not end with a period"
[[ "$title" =~ ^[A-Z] ]] || fail "title must start with a capital letter"

ai='(claude|anthropic|copilot|openai|chatgpt|gemini|cursor|codeium|tabnine)'
if printf '%s\n' "$message" | grep -qiE "^co-authored-by:.*$ai|generated (with|by) .*$ai|noreply@anthropic\.com|🤖"; then
    fail "AI attribution is not allowed"
fi
