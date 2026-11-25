#!/usr/bin/env python3
"""Verify that preserved source snapshots still match their recorded hashes."""

import csv
import hashlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
failures: list[str] = []

# Files moved out of the upstream tree by the 2026-10-09 honesty triage
# (see QUARANTINE.md). Their bytes are unchanged — each file's sha256 was
# re-verified against provenance/files.csv on 2026-11-24 — so the recorded
# hash is checked at the quarantine location instead of the upstream path.
RELOCATED = {
    "RouteA/lean/RiemannArakelovPositivity.lean": "Quarantine/RiemannArakelovPositivity.lean",
    "RouteB/lean/Closure/RouteBMasterReduction.lean": "Quarantine/RouteBMasterReduction.lean",
    "RouteB/lean/RHKimSarnakDescent.lean": "Quarantine/RHKimSarnakDescent.lean",
    "RouteC/lean/Littlewood/UniformToDensity.lean": "Quarantine/UniformToDensity.lean",
    "RouteC/lean/RouteC/RouteC_Unconditional_S4.lean": "Quarantine/RouteC_Unconditional_S4.lean",
    "RouteD/Eutheos/RationalTheta.lean": "Quarantine/RationalTheta.lean",
}

with (ROOT / "provenance/files.csv").open(newline="") as handle:
    for row in csv.DictReader(handle):
        path = ROOT / "upstream" / row["package"] / row["path"]
        if not path.is_file():
            moved = RELOCATED.get(f"{row['package']}/{row['path']}")
            if moved is not None:
                path = ROOT / moved
        if not path.is_file():
            failures.append(f"missing: {path.relative_to(ROOT)}")
            continue
        actual = hashlib.sha256(path.read_bytes()).hexdigest()
        if actual != row["sha256"]:
            failures.append(f"changed: {path.relative_to(ROOT)}")

if failures:
    raise SystemExit("\n".join(failures))

print("source snapshots match the recorded revisions")
