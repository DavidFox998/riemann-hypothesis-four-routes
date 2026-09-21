#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

test -s provenance/sources.csv
test -s provenance/declarations.csv
test -s provenance/files.csv
test "$(find upstream -mindepth 1 -maxdepth 1 -type d | wc -l)" -eq 6

for route in A B C D; do
  grep -q "import RH.Route${route}" RH/FourRoutes.lean
done

grep -q "RiemannArakelovPositivity.RH_from_arakelov_positivity_unconditional" RH/RouteA/Main.lean
grep -q "TheoremaAureum.Certificates.M5_H1_proved" RH/P5/Interface.lean
grep -q "RHKimSarnakDescent.Langlands.grh_to_rh_descent" RH/RouteB/Main.lean
grep -q "RHRouteC.riemannHypothesis_of_growth_and_repulsion" RH/RouteC/Main.lean
grep -q "SiegelElementary.eta_pos" RH/RouteD/Main.lean

if rg -n 'structure PublicationChain|terminal.*RiemannHypothesis' RH/Route* --glob '*.lean'; then
  echo "route publication proxy found" >&2
  exit 1
fi

if rg -n 'def RiemannHypothesis' RH --glob '*.lean' |
   grep -v 'RH/Core/Definition.lean'; then
  echo "route-local active RiemannHypothesis definition found" >&2
  exit 1
fi

if rg -n '\bsorry\b|\badmit\b' RH --glob '*.lean'; then
  echo "active publication tree contains unresolved scaffolding" >&2
  exit 1
fi

lake build RHTests

echo "structural audit passed"