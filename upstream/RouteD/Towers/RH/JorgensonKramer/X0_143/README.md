# Towers/RH/JorgensonKramer/X0_143 — X₀(143) Field Arithmetic and Class Number

Jorgenson-Kramer analytic torsion track for `X₀(143)`, concretely: the arithmetic of K₁ = ℚ(√−143) and the class number h(−143) = 10 that the whole N=143 conductor rests on.

| File | Role | Status |
|---|---|---|
| `Basic.lean` | Field setup: `X_sq_add_143_irred : Irreducible (X^2 + C 143)`, `α := AdjoinRoot.root`, `κ := 10π/√143` | 0 sorry |
| `Discriminant143.lean` | `Disc143_IntegralBasis_OPEN`, `K1_Discriminant_OPEN : NumberField.discr K = −143` | 2 open surfaces |
| `K1ClassNumber.lean` | Minkowski bound `minkowski_lt_eight : 2/π·√143 < 8`; upper/lower class-number open surfaces squeeze h = 10 | 5 open surfaces |
| `K1IdealGrowth.lean` | `k1_ideal_growth_law`, `K1_IdealCounting_OPEN` (Landau ideal counting) | 3 open surfaces |
| `C22_ClassNumberCert.lean` | C22 class-number certificate discharge | 3 open surfaces |
| `C22b_ClassNumberLowerBound.lean` | Norm-equation bridges `PrincipalNorm_Bridge_OPEN`, `EvenK_IntGen_Bridge_OPEN` | 2 open surfaces |

House rule: gaps are **def-Prop open surfaces**, not axioms — every `*_OPEN` is visible and tracked. Parent: [`Towers/RH/JorgensonKramer/`](../README.md). Constants feed `Towers/Common/` (g = 13, h = 10 for N = 143 = 11×13).
