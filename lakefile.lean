import Lake
open Lake DSL

package «rh-four-routes» where
  version := v!"0.1.0"
  leanOptions := #[⟨`autoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.15.0"

lean_lib RHCore where
  roots := #[`RH.Core]

-- RouteASource removed 2026-10-09: its only root (RiemannArakelovPositivity)
-- was quarantined (see QUARANTINE.md); Route A has no honest Lean source left.

lean_lib RouteBSource where
  srcDir := "upstream/RouteB/lean"
  roots := #[`Langlands.Descent]

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

lean_lib P5Source where
  srcDir := "upstream/P5"
  roots := #[
    `Towers.RH.Chain.C01_Arakelov,
    `Towers.RH.Formalized.Certificates
  ]

lean_lib RHP5 where
  roots := #[`RH.P5]

-- 2026-10-09 roadmap phase1: RHRouteA / RHRouteB wrappers quarantined
-- (their source files proved deceptive RH-claim artifacts; see QUARANTINE.md).

lean_lib RHRouteC where
  roots := #[`RH.RouteC]

lean_lib RHRouteD where
  roots := #[`RH.RouteD]

-- 2026-10-09 roadmap phase1: RHTests quarantined (it #checked the
-- quarantined wrappers' theorems, including a closed RH term built on the
-- sorried Route A bridge); RHFourRoutes aggregator quarantined
-- (it imported the quarantined Route A/B wrappers).