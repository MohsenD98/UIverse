#!/usr/bin/env python3
import sys
from pathlib import Path

from PIL import Image, ImageChops


NOISE = 2


def changed_fraction(before: Path, after: Path) -> float:
    a = Image.open(before).convert("RGB")
    b = Image.open(after).convert("RGB")
    if a.size != b.size:
        return 1.0
    histogram = ImageChops.difference(a, b).convert("L").histogram()
    changed = sum(histogram[NOISE + 1:])
    return changed / (a.size[0] * a.size[1])


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: compare-snapshots.py BEFORE_DIR AFTER_DIR", file=sys.stderr)
        return 2

    before_dir, after_dir = Path(sys.argv[1]), Path(sys.argv[2])
    identical = True

    for before in sorted(before_dir.glob("*.png")):
        after = after_dir / before.name
        if not after.exists():
            print(f"{before.name}: missing")
            identical = False
            continue
        fraction = changed_fraction(before, after)
        print(f"{before.name}: {fraction:.3%} changed")
        identical &= fraction == 0

    return 0 if identical else 1


if __name__ == "__main__":
    sys.exit(main())
