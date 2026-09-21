# ContradictionRoute — Growth × Repulsion Bridge (Route C surface)

The Route C contradiction shape, vendored here as the bridge Route D stands on: `GrowthBound` + `ZeroRepulsion → RiemannHypothesis`.

## Overview

- **`GrowthRepulsionBridge.lean`** — namespace `ContradictionRoute`: `GrowthBound : Prop := True`, `ZeroRepulsion := True`, `RiemannHypothesis := True`, and the composition `riemannHypothesis_of_growth_and_repulsion _ _ := trivial` — a **type-level placeholder**: the bridge carries the shape of the Route C argument (growth of ζ on the 1-line against zero repulsion forcing the critical strip) with the propositions instantiated trivially so imports typecheck. 0 sorry by construction — and 0 mathematical content. Treat as scaffolding, not as a proved implication.
- **`LanglandsWeilTransfer.lean`** — the named-open version: 6 open axioms (`SelbergWeil_BC6_bound`, `SelbergWeil_BC6_L_transfer`, `DeligneWeil_II_1974_purity`, `DeligneWeil_II_1974_L_purity`, `BostConnes_GNS_Gap_RH`, `BostConnes_GNS_Gap_L`) with `WeilTransfer_OPEN`, plus closed finite gate checks: `BrothersCount := 35`, `EutheosAnswer := 1419`, `brothers_mod_gate : 2113 % 35 = 13`, `eutheos_decomp : 1419 = 9*143+132`, `eutheos_mod_brothers : 1419 % 35 = 19`. Header: "Was: Route/RouteC.lean — 0 sorry — CLOSED".

## Files

| File | Role |
|---|---|
| `GrowthRepulsionBridge.lean` | Trivial-instantiated bridge consumed by Route D and Eutheos/Bridge — placeholder surfaces |
| `LanglandsWeilTransfer.lean` | Named-open Weil transfer axioms + closed finite gate arithmetic |

## Status

0 sorry in both files. 6 named open axioms in `LanglandsWeilTransfer.lean` — each is a literature-shaped gap (Selberg-Weil BC6, Deligne 1974 purity, Bost-Connes GNS gap), listed for the referee. The real Route C work (Littlewood ω, growth bounds) lives in [rh-growth-contradiction](https://github.com/DavidFox998/rh-growth-contradiction).

## Consumers

`Route/RouteD.lean` (`routeD_rh` via `riemannHypothesis_of_growth_and_repulsion`) and `Eutheos/Bridge.lean`.
