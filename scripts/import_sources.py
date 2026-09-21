#!/usr/bin/env python3
"""Copy immutable source snapshots and generate declaration provenance."""

from __future__ import annotations

import csv
import hashlib
import re
import shutil
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE_ROOT = Path("/tmp/rh-six")
SOURCES = {
    "Core": "arakelov-positivity-rh-core",
    "P5": "rh-p5-bridge-14",
    "RouteA": "riemann-arakelov-positivity",
    "RouteB": "arakelov-rh-descent",
    "RouteC": "rh-growth-contradiction",
    "RouteD": "brothers-desert-proof",
}
DECL = re.compile(
    r"^\s*(?:protected\s+|private\s+)?"
    r"(def|abbrev|structure|class|inductive|theorem|lemma|axiom|constant)\s+"
    r"([A-Za-z_][A-Za-z0-9_'.]*)"
)


def revision(path: Path) -> str:
    return subprocess.check_output(
        ["git", "-C", str(path), "rev-parse", "HEAD"], text=True
    ).strip()


def copy_snapshot(source: Path, target: Path) -> None:
    if target.exists():
        shutil.rmtree(target)
    shutil.copytree(
        source,
        target,
        ignore=shutil.ignore_patterns(".git", ".lake", "lake-packages", "*.olean"),
    )


def main() -> None:
    upstream = ROOT / "upstream"
    upstream.mkdir(exist_ok=True)
    rows: list[list[str]] = []
    source_rows: list[list[str]] = []
    file_rows: list[list[str]] = []
    for label, repository in SOURCES.items():
        source = SOURCE_ROOT / repository
        if not source.is_dir():
            raise SystemExit(f"missing source checkout: {source}")
        rev = revision(source)
        copy_snapshot(source, upstream / label)
        source_rows.append([label, repository, rev])
        for source_file in sorted(source.rglob("*")):
            if not source_file.is_file() or ".git" in source_file.parts or ".lake" in source_file.parts:
                continue
            relative = source_file.relative_to(source)
            digest = hashlib.sha256(source_file.read_bytes()).hexdigest()
            file_rows.append([label, repository, rev, str(relative), digest])
        for lean_file in sorted(source.rglob("*.lean")):
            if ".lake" in lean_file.parts:
                continue
            relative = lean_file.relative_to(source)
            for number, line in enumerate(
                lean_file.read_text(errors="replace").splitlines(), start=1
            ):
                match = DECL.match(line)
                if match:
                    rows.append(
                        [
                            label,
                            repository,
                            rev,
                            str(relative),
                            str(number),
                            match.group(1),
                            match.group(2),
                        ]
                    )

    provenance = ROOT / "provenance"
    provenance.mkdir(exist_ok=True)
    with (provenance / "sources.csv").open("w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["package", "repository", "revision"])
        writer.writerows(source_rows)
    with (provenance / "declarations.csv").open("w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(
            ["package", "repository", "revision", "path", "line", "kind", "declaration"]
        )
        writer.writerows(rows)
    with (provenance / "files.csv").open("w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["package", "repository", "revision", "path", "sha256"])
        writer.writerows(file_rows)
    print(f"copied {len(SOURCES)} source snapshots; indexed {len(rows)} declarations")


if __name__ == "__main__":
    main()