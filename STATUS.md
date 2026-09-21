# Publication Status

| Layer | Snapshot preserved | Indexed | Concrete source root active | Source parity |
|---|---:|---:|---:|---:|
| RH Core | yes | yes | canonical predicate | pending review |
| P5 bridge | yes | yes | publication boundary | pending review |
| Route A | yes | yes | Arakelov source terminal | pending review |
| Route B | yes | yes | finite certificate + Langlands descent | pending review |
| Route C | yes | yes | growth/repulsion theorem | pending review |
| Route D | yes | yes | eta + self-symmetry + terminal composition | pending review |

“Pending review” means declaration-by-declaration publication migration has not
yet been signed off. It makes no claim about the underlying mathematics.

No standalone repository should be made private until every row has passed
source parity review.

The active route roots are checked by `Tests/RouteRoots.lean`. Their current
Lean trust dependencies are recorded in `docs/trust-report.md`.