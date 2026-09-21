#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

test -s provenance/sources.csv
test -s provenance/declarations.csv
test "$(find upstream -mindepth 1 -maxdepth 1 -type d | wc -l)" -eq 6

for route in A B C D; do
  grep -q "import RH.Route${route}" RH/FourRoutes.lean
done

if rg -n 'def RiemannHypothesis' RH --glob '*.lean' |
   grep -v 'RH/Core/Definition.lean'; then
  echo "route-local active RiemannHypothesis definition found" >&2
  exit 1
fi

if rg -n '\bsorry\b|\badmit\b' RH --glob '*.lean'; then
  echo "active publication tree contains unresolved scaffolding" >&2
  exit 1
fi

echo "structural audit passed"