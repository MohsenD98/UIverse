#!/usr/bin/env bash
set -uo pipefail

base="${1:?usage: check-commits.sh BASE [CMAKE_ARGS...]}"
shift

repo="$(git rev-parse --show-toplevel)"
worktree="$(mktemp -d)/uiverse-commits"
status=0

cleanup() {
    git -C "$repo" worktree remove --force "$worktree" >/dev/null 2>&1
}
trap cleanup EXIT

git -C "$repo" worktree add --quiet --detach "$worktree" "$base"
cmake -S "$worktree" -B "$worktree/build" -G Ninja -DCMAKE_BUILD_TYPE=Release "$@" >/dev/null

for commit in $(git -C "$repo" rev-list --reverse "$base..HEAD"); do
    title="$(git -C "$repo" log -1 --format='%h %s' "$commit")"
    git -C "$worktree" checkout --quiet --detach "$commit"

    if ! cmake --build "$worktree/build" >"$worktree/build.log" 2>&1; then
        echo "FAIL build  $title"
        grep -iE "error" "$worktree/build.log" | head -5
        status=1
        continue
    fi

    if ! compgen -G "$worktree/build/tst_uiverse*" >/dev/null; then
        echo "ok          $title (no tests yet)"
        continue
    fi

    if ! (cd "$worktree/build" && QT_QPA_PLATFORM=offscreen ./tst_uiverse -o result.txt,txt >/dev/null 2>&1); then
        echo "FAIL tests  $title"
        grep -E "^FAIL|unavailable|non-existent" "$worktree/build/result.txt" | head -5
        status=1
        continue
    fi

    echo "ok          $title"
done

exit "$status"
