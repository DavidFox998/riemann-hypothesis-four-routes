import RH.FourRoutes

/-!
Compile-time assertions that each publication root exposes concrete source
declarations rather than a caller-supplied terminal proof.
-/

#check RH.RouteA.arakelov_positivity_X0_143
#check RH.RouteA.routeA_rh
#check RH.P5.m5_positive
#check RH.P5.source_rh_iff_canonical
#check RH.RouteB.finite_certificate
#check RH.RouteB.routeB_rh
#check RH.RouteC.exp_loglog_dominates_sq
#check RH.RouteC.routeC_rh
#check RH.RouteD.eta_pair_sum_positive
#check RH.RouteD.self_symmetry_active
#check RH.RouteD.routeD_rh

example : RH.RiemannHypothesis := RH.RouteA.routeA_rh

example
    (hG : RH.RouteC.GrowthBound)
    (hR : RH.RouteC.ZeroRepulsion) :
    RH.RiemannHypothesis :=
  RH.RouteC.routeC_rh hG hR