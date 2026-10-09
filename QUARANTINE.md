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

## Known live importers (reported, not edited)

The following wrapper files import quarantined modules and have their own
substantive content, so they were left in place for the coordinator's
decision. The build closure currently references modules that no longer
exist:

- `RH/RouteA/Main.lean` — imports `RiemannArakelovPositivity`; `routeA_rh` adapts the quarantined `RH_from_arakelov_positivity_unconditional` via `RH.fromMathlib`.
- `RH/RouteB/Main.lean` — imports `RHKimSarnakDescent`; `finite_certificate` uses the quarantined `RHKimSarnakDescent_v6` namesake theorems, and `routeB_rh` uses `Langlands.Descent` (retained).

Consequences: `lake build RHRouteA` / `lake build RHRouteB` / `lake build RHTests`
fail until these wrappers are triaged; `Tests/RouteRoots.lean` `#check`s
`RH.RouteA.routeA_rh`, `RH.RouteB.finite_certificate`, and `RH.RouteB.routeB_rh`.
