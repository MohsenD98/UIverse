#!/usr/bin/env bash
set -euo pipefail

if [[ -n "${QMLFORMAT:-}" ]]; then
    echo "$QMLFORMAT"
    exit 0
fi

if command -v qmlformat >/dev/null 2>&1; then
    command -v qmlformat
    exit 0
fi

if [[ -n "${QT_ROOT_DIR:-}" && -x "$QT_ROOT_DIR/bin/qmlformat" ]]; then
    echo "$QT_ROOT_DIR/bin/qmlformat"
    exit 0
fi

found="$(ls -d /c/Qt/6.*/*/bin/qmlformat.exe "$HOME"/Qt/6.*/*/bin/qmlformat /opt/Qt/6.*/*/bin/qmlformat 2>/dev/null | sort -V | tail -n1 || true)"
if [[ -n "$found" ]]; then
    echo "$found"
    exit 0
fi

echo "qmlformat not found. Set QMLFORMAT or add Qt's bin directory to PATH." >&2
exit 1
