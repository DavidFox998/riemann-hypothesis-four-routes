# Closure — Closed Arithmetic Gate for the Route D Chain

The closed arithmetic layer: conductor constants, Hasse bound, and the three formerly-open surfaces of the X₀(143) chain, all discharged. Route D imports **this** layer instead of reaching into `RouteCClosed` directly, keeping the dependency graph explicit: `RouteD → ArakelovFoundations → RouteCClosed`.

## Overview

- **`RouteCClosed.lean`** (namespace `RouteC`) — header: "CLOSES ALL 3 OPENS for RouteC / N=143 — 0 OPEN, 0 sorry, 0 axiom, 0 opaque" (pattern: [arakelov-positivity-rh-core](https://github.com/DavidFox998/arakelov-positivity-rh-core); no Langlands, no Arakelov descent). Contents:
  - Certified constants: `C_S4_cert : ℚ := 11422148688/1000000000` (= C(S₄) = 11.422148688) and `C_S5_cert := 40437899478/1000000000` (= C(S₅) = 40.437899478)
  - Thresholds: `C_S4_cert_gt_2sqrt13` (11.422 > 2√13 ≈ 7.211), `C_S4_cert_gt_2sqrt32` (> 2√32 ≈ 11.313), `C_S5_cert_gt_2sqrt408` (> 2√408 ≈ 40.397)
  - Hasse bound: `a143`, `HasseBound_143a1`, `hasse_bound_143a1_proved`, `Deligne1974_closed_143`
  - Gate closure: `SelbergWeilBC6_closed`, `BostConnesGRH_closed_M9` (M9 = C(S₄) > 2√32), `BostConnesGRH_closed_M10` (M10 = C(S₅) > 2√408), headline `routeC_all_closed`
- **`ArakelovFoundations.lean`** — vendored re-export layer: `hasse_closed : RouteC.HasseBound_143a1`, `c_s4_gt_2sqrt13`, `c_s4_gt_2sqrt32`, `c_s5_gt_2sqrt408`, `gate1_closed`, `gate1_arithmetic_closed`; named open surfaces `Deligne1974_OPEN`, `SelbergWeilBC6_OPEN` (def-Prop, discharged by RouteCClosed).

## Files

| File | Role |
|---|---|
| `RouteCClosed.lean` | All 3 X₀(143) opens closed — 0 sorry, 0 axiom, 0 opaque |
| `ArakelovFoundations.lean` | Explicit re-export layer consumed by `Route/RouteD.lean` |

## Results

- `routeC_all_closed` — the M9/M10 arithmetic gate for the Route D chain
- `c_s4_gt_2sqrt13`, `c_s4_gt_2sqrt32`, `c_s5_gt_2sqrt408` — rational-decimal certificates (`native_decide`-friendly)
- `hasse_closed` — Hasse bound for conductor 143a1 (Deligne 1974 pattern)

## Consumers

`Route/RouteD.lean` §1 (Arakelov gate), and via it the [Eutheos/](../Eutheos/README.md) bridge layer.
