# Route — The Four Voices, One Folder

Route A, B, and D side by side, each a Lean-verified conditional reduction to RH. Route D is this repo's own voice; Routes A and B are vendored bridges to their standalone repos.

## Overview

All four routes of the Opera share the same arithmetic gate — S₄ = {2,3,19,191}, C(S₄) = 11.422 > 2√13 ≈ 7.211 — and each closes a conditional chain through GRH on X₀(143) toward RH. **RH remains OPEN.** What closes here is the reduction architecture, honestly labeled.

- **`RouteA.lean`** (source: [riemann-arakelov-positivity](https://github.com/DavidFox998/riemann-arakelov-positivity)) — Arakelov Positivity: open surfaces `ArakelovPairing_143`, `HeckeSelfIntersection_143`, `AbbesUllmo_Equidistribution`, `RouteA_PositivityToGRH`; unconditional `X0_143_genus : 13`; headline `routeA_rh (h_pos) (h_equi) (h_grh) : RiemannHypothesis`. 0 sorry — conditional on the def-Prop surfaces (Mathlib has no Arakelov intersection theory).
- **`RouteB.lean`** (source: [arakelov-rh-descent](https://github.com/DavidFox998/arakelov-rh-descent)) — Kim-Sarnak spectral descent: `spectral_gap_value : 975/4096 > 3/16`, `CS4 := Cp 2 + Cp 3 + Cp 19 + Cp 191`, `CS5 := CS4 + Cp p5` with p5 = 3993746143633; thresholds `CS4_gt_2sqrt13/2sqrt32`, `CS5_gt_2sqrt408`; steps `step3_M9_X0143_GRH`, `step5_M10_p5`. 4 named axioms (`ramanujan_deligne`, `bost_connes_thm6`, `CS4_ge_lb`, `CS5_ge_lb`), each cited.
- **`RouteD.lean`** — this repo's route: §1 vendored Arakelov gate (`arakelov_c_s4_closed : (RouteC.C_S4_cert : ℝ) > 2*√13` via [Closure/ArakelovFoundations.lean](../Closure/README.md)), §3 "Superbrick" theorems delegating to `Siegel/SiegelElementary.lean` (`Superbrick_FE_base : 1 − 2^{1−σ} < 0` via `factor_neg`, `Superbrick_SmallDenom`, `rational_contradicts_brothers`), headline `routeD_rh (hG : GrowthBound) (hZ : ZeroRepulsion) : RiemannHypothesis` via the [ContradictionRoute](../ContradictionRoute/README.md) bridge.

**Status note on RouteD:** its import list (`Route.RouteC`, `RouteC.GrowthRepulsionBridge`) and two lemma references (`ZetaRealSign`, `zeta_no_real_zero`) do not resolve against the current tree — Route C's bridge lives in [ContradictionRoute/](../ContradictionRoute/README.md) (`ContradictionRoute.GrowthRepulsionBridge`) and SiegelElementary exposes `zeta_no_real_zero_core`. Route D is presented as the composition architecture, not as a compiling artifact; CI builds the Siegel and SelfSymmetry layers it stands on.

## Files

| File | Route | Source |
|---|---|---|
| `RouteA.lean` | A — Arakelov Positivity (ω² = 48/13) | riemann-arakelov-positivity |
| `RouteB.lean` | B — Kim-Sarnak spectral descent (λ₁ ≥ 975/4096) | arakelov-rh-descent |
| `RouteD.lean` | D — discrete self-symmetry of the 35 brothers | this repo |

Route C (growth contradiction) lives in [rh-growth-contradiction](https://github.com/DavidFox998/rh-growth-contradiction); its bridge surface is mirrored in [ContradictionRoute/](../ContradictionRoute/README.md).

## Honesty

Reduction only. Each `routeX_rh` takes explicitly stated hypotheses (positivity, equidistribution, GRH, growth bound, zero repulsion) and composes them to `RiemannHypothesis`. The hypotheses are named open surfaces — visible in the files, not hidden in axioms (exception: Route B's 4 documented cert axioms).
