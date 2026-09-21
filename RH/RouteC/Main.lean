import RH.Core
import growthbound

namespace RH.RouteC

abbrev GrowthBound : Prop := RHRouteC.GrowthBound
abbrev ZeroRepulsion : Prop := RHRouteC.ZeroRepulsion

/-- Route C's substantive asymptotic domination theorem. -/
theorem exp_loglog_dominates_sq
    (C c₁ : ℝ) (hC : 0 < C) (hc₁ : 0 < c₁) :
    ∀ᶠ t in Filter.atTop,
      C * (Real.log t) ^ 2 <
        Real.exp (c₁ * Real.log t / Real.log (Real.log t)) :=
  RHRouteC.exp_loglog_dominates_sq C c₁ hC hc₁

/-- The concrete Route C implication, adapted to the canonical RH predicate. -/
theorem routeC_rh (hG : GrowthBound) (hR : ZeroRepulsion) :
    RH.RiemannHypothesis :=
  RH.fromMathlib
    (RHRouteC.riemannHypothesis_of_growth_and_repulsion hG hR)

end RH.RouteC