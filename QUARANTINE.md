# QUARANTINE.md

Artifacts removed from the active tree during the honesty triage
(roadmap Phase 0/1). Each entry records the quarantine date, the original
path, and the audit finding that motivated the move. Nothing here is part of
the build closure; `scripts/audit.sh` excludes `Quarantine/` from its
whole-tree checks.

| Date | Original path | Reason |
|---|---|---|
| 2026-10-09 | `upstream/RouteD/Eutheos/RationalTheta.lean` | Orphaned axioms: declares `axiom Superbrick_SmallDenom` and `axiom Superbrick_FE_base`; no lakefile root in the build closure imports `Eutheos.*` (RouteDSource roots cover only Siegel/Family/SelfSymmetry). |
| 2026-10-09 | `upstream/RouteB/lean/RHKimSarnakDescent.lean` | Deceptive namesake: locally redefines `def RiemannHypothesis` as a BSD predicate (`BSD_EndomorphismDegree_CLOSED ∧ BSD_LFunctionIsLinFunc_CLOSED`) and "proves" it via `clay_certificate_kim_sarnak` — not the Clay RH statement. |
| 2026-10-09 | `upstream/RouteB/lean/Closure/RouteBMasterReduction.lean` | Same namesake pattern: `def RiemannHypothesis` redefined over BSD predicates, `clay_certificate_kim_sarnak` terminal; orphaned from the build closure (no lakefile root covers `Closure/`). |
| 2026-10-09 | `upstream/RouteA/lean/RiemannArakelovPositivity.lean` | False "No sorry · no axiom" header: `ArakelovPositivity_to_RH_CLOSED` is proved `intro _hPos; sorry`; file also declares `axiom ramanujan : True` and `axiom no_CM : True` and sorry-proves `C_S4_gt_2sqrt13` / `RouteA_CLOSED_via_S4`. Route A's Lean proof does not exist. |
| 2026-10-09 | `upstream/RouteC/lean/Littlewood/UniformToDensity.lean` | Literal `sorry` under "CLOSED FINAL" marketing: the upstream Littlewood README calls this file "FINAL 1pp CLOSED FINAL" while `uniform_to_density` ends `have hvol ...; sorry`. |
| 2026-10-09 | `upstream/RouteC/lean/RouteC/RouteC_Unconditional_S4.lean` | False unconditional close: `RouteC_Unconditional_Close : Clay_RH` proved by `sorry`, backed by `axiom ramanujan : True` / `axiom no_CM : True`; its local `Clay_RH := ∀ ρ, riemannZeta ρ = 0 → ρ.re = 1/2` does not exclude trivial zeros, so as stated it is false. The honest conditional `routeC_rh` in `RH/RouteC/Main.lean` is untouched. |

| 2026-10-09 | `RH/RouteA/Main.lean` | Wrapper of quarantined content: both theorems (`arakelov_positivity_X0_143`, `routeA_rh`) are direct adaptations of `RiemannArakelovPositivity.*` (quarantined above); `routeA_rh` builds a closed RH term on the sorried bridge. No independent substance. |
| 2026-10-09 | `RH/RouteA.lean` | Pure re-export shim: `import RH.RouteA.Main` (quarantined above). |
| 2026-10-09 | `RH/RouteB/Main.lean` | Mixed wrapper: `finite_certificate` proves the quarantined `RHKimSarnakDescent_v6` namesake (deceptive RH-claim artifact); `routeB_rh` is an honest conditional but inseparable without editing proof content. Preserved here and in git history; the underlying honest combinator remains in retained `Langlands.Descent`. |
| 2026-10-09 | `RH/RouteB.lean` | Pure re-export shim: `import RH.RouteB.Main` (quarantined above). |
| 2026-10-09 | `RH/FourRoutes.lean` | Aggregator wrapper importing the quarantined `RH.RouteA` / `RH.RouteB` shims. |
| 2026-10-09 | `Tests/RouteRoots.lean` | Test wrapper: `#check`ed the quarantined wrappers' theorems and contained `example : RH.RiemannHypothesis := RH.RouteA.routeA_rh` — a closed RH term built on the sorried Route A bridge. |

## Resolved: former live importers (2026-10-09, coordinator)

The wrapper files listed in the previous revision's "Known live importers"
section (`RH/RouteA/Main.lean`, `RH/RouteB/Main.lean`) have now been quarantined
per the task's wrapper rule (a wrapper importing quarantined modules is
quarantined too; no replacement content invented). The lakefile's `RHRouteA`,
`RHRouteB`, `RHTests`, and `RHFourRoutes` lib blocks were removed. Remaining
build libs: `RHCore`, `RouteBSource` (`Langlands.Descent`), `RouteCSource`,
`RouteDSource`, `P5Source`, `RHP5`, `RHRouteC`, `RHRouteD`.
