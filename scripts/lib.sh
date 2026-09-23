pack_keys() {
    local dir
    for dir in "$(git rev-parse --show-toplevel)"/styles/*/; do
        dir="$(basename "$dir")"
        [[ "$dir" == "registry" ]] || echo "$dir"
    done
}

snapshot_tool() {
    local tool="$1/uiverse-snapshot"
    [[ -f "$tool.exe" ]] && tool="$tool.exe"
    echo "$tool"
}
