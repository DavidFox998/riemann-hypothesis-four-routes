# Publication Status

| Layer | Snapshot preserved | Indexed | Concrete source root active | Standalone visibility |
|---|---:|---:|---:|---:|
| RH Core | yes | yes | canonical predicate | unchanged |
| P5 bridge | yes | yes | M5 certificate + RH equivalence | unchanged |
| Route A | yes | yes | Arakelov source terminal | private |
| Route B | yes | yes | finite certificate + Langlands descent | private |
| Route C | yes | yes | growth/repulsion theorem | private |
| Route D | yes | yes | eta + self-symmetry + terminal composition | private |

The four source snapshots match their recorded revisions and are present in the
verified unified GitHub tree. Their standalone repositories were made private
only after the snapshot and active-root checks passed.

The active route roots are checked by `Tests/RouteRoots.lean`. Their current
Lean trust dependencies are recorded in `docs/trust-report.md`.