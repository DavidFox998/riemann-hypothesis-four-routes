import Mathlib

/-!
# Canonical Riemann Hypothesis statement

This is the only public RH predicate used by the unified publication tree.
Route-local source predicates remain in `upstream/` for provenance but are not
part of the active namespace.
-/

namespace RH

def IsTrivialZero (s : ℂ) : Prop :=
  ∃ n : ℕ, s = -2 * (n + 1 : ℂ)

def IsNontrivialZero (s : ℂ) : Prop :=
  riemannZeta s = 0 ∧ s ≠ 1 ∧ ¬ IsTrivialZero s

def RiemannHypothesis : Prop :=
  ∀ s : ℂ, IsNontrivialZero s → s.re = 1 / 2

end RH