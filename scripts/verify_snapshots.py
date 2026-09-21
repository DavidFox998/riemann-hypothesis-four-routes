#!/usr/bin/env python3
"""Verify that preserved source snapshots still match their recorded hashes."""

import csv
import hashlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
failures: list[str] = []

with (ROOT / "provenance/files.csv").open(newline="") as handle:
    for row in csv.DictReader(handle):
        path = ROOT / "upstream" / row["package"] / row["path"]
        if not path.is_file():
            failures.append(f"missing: {path.relative_to(ROOT)}")
            continue
        actual = hashlib.sha256(path.read_bytes()).hexdigest()
        if actual != row["sha256"]:
            failures.append(f"changed: {path.relative_to(ROOT)}")

if failures:
    raise SystemExit("\n".join(failures))

print("source snapshots match the recorded revisions")