# Towers/RH/JorgensonKramer — Analytic Torsion and the K₁ Arithmetic of ℚ(√−143)

Jorgenson–Kramer analytic torsion track for `X₀(143)`. The README for the actual files lives in [`X0_143/`](X0_143/README.md).

## Contents

Single subfolder, [`X0_143/`](X0_143/README.md) — six files covering the ℚ(√−143) field setup, discriminant, class number, ideal growth, and the C22 class-number certificate chain:

| File | Role | Status |
|---|---|---|
| `Basic.lean` | `X_sq_add_143_irred`, `α := AdjoinRoot.root`, `κ := 10π/√143` | 0 sorry |
| `Discriminant143.lean` | `Disc143_IntegralBasis_OPEN`, `K1_Discriminant_OPEN : NumberField.discr K = −143` | 2 open surfaces |
| `K1ClassNumber.lean` | Minkowski bound `minkowski_lt_eight : 2/π·√143 < 8`, class-number ≤10/≥10 pair → h = 10 | 5 open surfaces |
| `K1IdealGrowth.lean` | `k1_ideal_growth_law`, `K1_IdealCounting_OPEN` (Landau) | 3 open surfaces |
| `C22_ClassNumberCert.lean` | C22 certificate discharge | 3 open surfaces |
| `C22b_ClassNumberLowerBound.lean` | norm-equation bridges `PrincipalNorm_Bridge_OPEN`, `EvenK_IntGen_Bridge_OPEN` | 2 open surfaces |

House rule: gaps are declared as **def-Prop open surfaces**, not axioms — every `*_OPEN` name is visible, greppable, and tracked.
