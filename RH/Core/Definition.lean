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

theorem fromMathlib (h : _root_.RiemannHypothesis) : RiemannHypothesis := by
  intro s hs
  exact h s hs.1 hs.2.2 hs.2.1

theorem toMathlib (h : RiemannHypothesis) : _root_.RiemannHypothesis := by
  intro s hs htrivial hone
  exact h s ⟨hs, hone, htrivial⟩

theorem rh_iff_mathlib : RiemannHypothesis ↔ _root_.RiemannHypothesis :=
  ⟨toMathlib, fromMathlib⟩

end RH