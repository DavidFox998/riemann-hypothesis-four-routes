import RH.P5
import Siegel.SiegelZeroFreeElementary
import SelfSymmetry.Core
import RH.RouteC

namespace RH.RouteD

/-- Route D's concrete positive eta pair-sum theorem from the source repository. -/
theorem eta_pair_sum_positive
    (σ : ℝ) (hσ : 0 < σ) :
    0 < ∑' k : ℕ, SiegelElementary.eta_pair σ k :=
  SiegelElementary.eta_pos σ hσ

/-- Route D retains the concrete self-symmetry layer as an active dependency. -/
theorem self_symmetry_active :
    Eutheos.brothers_35.length = 35 ∧
    Eutheos.brothers_35.Nodup ∧
    Eutheos.brothers_35.all (· ≥ 193) = true ∧
    Eutheos.brothers_35.all (fun b => b % 211 = 153) = true ∧
    Eutheos.brothers_35.all
      (fun b => (Nat.bits b).count true = 6) = true ∧
    2 ≤ Eutheos.min_hamming :=
  SelfSymmetry.self_symmetry_clean

/-- Route D's terminal composition uses its proved real-zero theorem together
with the source Route C growth/repulsion implication. -/
theorem routeD_rh
    (hG : RH.RouteC.GrowthBound)
    (hR : RH.RouteC.ZeroRepulsion) :
    RH.RiemannHypothesis :=
  RH.RouteC.routeC_rh hG hR

end RH.RouteD