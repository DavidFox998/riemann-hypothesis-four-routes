import Lake
open Lake DSL

package «rh-four-routes» where
  version := v!"0.1.0"
  leanOptions := #[⟨`autoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.15.0"

lean_lib RHCore where
  roots := #[`RH.Core]

lean_lib RouteASource where
  srcDir := "upstream/RouteA/lean"
  roots := #[`RiemannArakelovPositivity]
  leanOptions := #[⟨`maxRecDepth, .ofNat 100000⟩]

lean_lib RouteBSource where
  srcDir := "upstream/RouteB/lean"
  roots := #[`RHKimSarnakDescent, `Langlands.Descent]

lean_lib RouteCSource where
  srcDir := "upstream/RouteC/lean"
  roots := #[`growthbound]

lean_lib RouteDSource where
  srcDir := "upstream/RouteD"
  roots := #[
    `Siegel.SiegelZeroFreeElementary,
    `Family.Brothers1419,
    `Family.BrothersAnalysis,
    `Family.GapHamming,
    `SelfSymmetry.Core
  ]

lean_lib RHP5 where
  roots := #[`RH.P5]

lean_lib RHRouteA where
  roots := #[`RH.RouteA]

lean_lib RHRouteB where
  roots := #[`RH.RouteB]

lean_lib RHRouteC where
  roots := #[`RH.RouteC]

lean_lib RHRouteD where
  roots := #[`RH.RouteD]

lean_lib RHTests where
  roots := #[`Tests.RouteRoots]

@[default_target]
lean_lib RHFourRoutes where
  roots := #[`RH.FourRoutes]