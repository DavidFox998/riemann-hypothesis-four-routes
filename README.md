# Riemann Hypothesis: Four Routes

This repository is the publication workspace for RH Core, the P5 bridge, and
four independent formal routes. It preserves the six source repositories at
exact revisions while giving active publication code one toolchain, one RH
predicate, searchable provenance, and explicit route boundaries.

## Status language

Three questions are recorded separately:

1. **Mathematical status:** what the cited mathematics establishes.
2. **Formalization status:** whether its Lean declaration is located, migrated,
   wired into the active build, and compiled.
3. **Source status:** where the result and its dependencies can be found.

“Not in Mathlib,” “not yet migrated,” and “not yet wired” do not mean
mathematically open or false.

## Layout

- `RH/Core/` — canonical RH statement and publication metadata.
- `RH/P5/` — shared P5 boundary.
- `RH/RouteA/` through `RH/RouteD/` — independent publication interfaces.
- `upstream/` — immutable snapshots of all six source repositories.
- `provenance/` — generated source and declaration indexes.
- `docs/` — publication order, migration policy, and route guides.
- `scripts/` — repeatable source import and structural audit.

## Build and audit

```bash
python scripts/import_sources.py
lake update
lake build RHCore
lake build RHP5
lake build RHRouteA
lake build RHRouteB
lake build RHRouteC
lake build RHRouteD
lake build
scripts/audit.sh
```

The active tree deliberately excludes historical source predicates from the
root build. They remain searchable under `upstream/` until migrated with
provenance.

## Repository visibility

The four standalone route repositories are private after snapshot parity and
active-root verification. Their Git histories are retained. This unified
repository is currently private staging and is the publication source to make
public when the release ledger is complete.

## Opera Numerorum — ensemble map

**[arakelov-positivity-rh-core](https://github.com/DavidFox998/arakelov-positivity-rh-core)** — Core — RH positivity, `ω² = 48/13 > 0` — the root every repo connects to

*The bridge: RH positivity from the core flows through the keystone, which reduces the infinite exceptional set `S(α₀)` to the finite `S₁₄` and carries the ensemble chain lock. Every repo below works from the bridge.*

**[rh-p5-bridge-14](https://github.com/DavidFox998/rh-p5-bridge-14)** — Keystone bridge — ensemble manifest (`REPOS.md`) and chain lock

**[riemann-hypothesis-four-routes](https://github.com/DavidFox998/riemann-hypothesis-four-routes)** — Four routes — **This Repo** — the RH routes working from the bridge (public workspace)

**[birch-swinnerton-dyer-143](https://github.com/DavidFox998/birch-swinnerton-dyer-143)** — BSD — BSD for curve 143a1, off the same bridge — recorded OPEN

**[poincare-spectral](https://github.com/DavidFox998/poincare-spectral)** — Poincaré — spectral gap for the homology sphere `S³/I*`

**[lindelof-hypothesis-143](https://github.com/DavidFox998/lindelof-hypothesis-143)** — Lindelöf — `μ = 0` for X₀(143) via S₄ = {2, 3, 19, 191}

**[navier-stokes](https://github.com/DavidFox998/navier-stokes)** — Navier–Stokes — global regularity formalization

**[yang-mills-gap](https://github.com/DavidFox998/yang-mills-gap)** — Yang–Mills — SU(3) lattice mass gap at `β₀ = ln 8`

**[p-vs-np](https://github.com/DavidFox998/p-vs-np)** — P vs NP — mechanics; conditional `SAT ∉ P → P ≠ NP`

**[eutheos-property](https://github.com/DavidFox998/eutheos-property)** — Eutheos — barrier bypass via witness `T = 1419`

**[bost-connes](https://github.com/DavidFox998/bost-connes)** — Bost–Connes — arithmetic hub; `C(S₄) = 11.422 > 2√13`

**[zerobeacon](https://github.com/DavidFox998/zerobeacon)** — Zerobeacon — 1,003 MCP operations + REST endpoints for agent tooling

**[beal-conjecture](https://github.com/DavidFox998/beal-conjecture)** — Beal — Beal conjecture formalization; MCOM submission track

**[birch-swinnerton-dyer-143a1](https://github.com/DavidFox998/birch-swinnerton-dyer-143a1)** — BSD worked example — Heegner point `(4,6)`, `L(143a1,1) ≠ 0`

**[hodge-abelian-boundaries](https://github.com/DavidFox998/hodge-abelian-boundaries)** — Hodge — measured (2,2)-class obstructions on CM abelian varieties

**[morningstar-project](https://github.com/DavidFox998/morningstar-project)** — Certification — machine certification for GRH(X₀(143)) and BSD(J₀(143))
