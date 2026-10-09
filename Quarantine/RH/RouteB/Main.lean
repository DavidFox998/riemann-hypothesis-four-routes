import RH.P5
import RHKimSarnakDescent
import Langlands.Descent

namespace RH.RouteB

/-- Route B's concrete finite certificate from the source repository. -/
theorem finite_certificate :
    RHKimSarnakDescent_v6.RiemannHypothesis ∧
      RHKimSarnakDescent_v6.C_S4_sum > 7.21 ∧
      RHKimSarnakDescent_v6.J0143_conductor = 11 * 13 :=
  RHKimSarnakDescent_v6.final_certificate_genuine

/-- The concrete Langlands descent combinator, with its two named inputs. -/
theorem routeB_rh
    (L_fn : ℂ → ℂ)
    (h_grh : RHKimSarnakDescent.Langlands.GRH_for_L L_fn)
    (h_transfer : RHKimSarnakDescent.Langlands.LanglandsTransfer L_fn) :
    RH.RiemannHypothesis :=
  RH.fromMathlib
    (RHKimSarnakDescent.Langlands.grh_to_rh_descent
      L_fn h_grh h_transfer)

end RH.RouteB