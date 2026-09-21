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

The standalone route repositories should become private only after source
parity has been reviewed. Their Git histories are retained; this repository
becomes the discoverable publication source.