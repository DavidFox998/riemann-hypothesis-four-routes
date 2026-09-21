import RH.P5
import RiemannArakelovPositivity

namespace RH.RouteA

/-- The concrete source theorem for Arakelov positivity on the level-143 object. -/
theorem arakelov_positivity_X0_143 :
    RiemannArakelovPositivity.ArakelovPositivity
      (RiemannArakelovPositivity.X₀ 143) :=
  RiemannArakelovPositivity.arakelov_positivity_X0_143

/-- Route A's source terminal theorem, adapted to the canonical RH predicate. -/
theorem routeA_rh : RH.RiemannHypothesis :=
  RH.fromMathlib
    RiemannArakelovPositivity.RH_from_arakelov_positivity_unconditional

end RH.RouteA