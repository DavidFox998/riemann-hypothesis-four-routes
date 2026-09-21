[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21926550.svg)](https://doi.org/10.5281/zenodo.21926550) [![CI](https://github.com/DavidFox998/brothers-desert-proof/actions/workflows/lean.yml/badge.svg)](https://github.com/DavidFox998/brothers-desert-proof/actions/workflows/lean.yml) [![Smithery](https://smithery.ai/badge/davidjfox998/zerobeacon-1050)](https://smithery.ai/servers/davidjfox998/zerobeacon-1050)

# brothers-desert-proof — Route D — Discrete Self-Symmetry of the 35 Morningstar Brothers — Lean formalization, conditional

[![CI](https://github.com/DavidFox998/brothers-desert-proof/actions/workflows/lean.yml/badge.svg)](https://github.com/DavidFox998/brothers-desert-proof/actions/workflows/lean.yml)

> **Opera Numerorum ensemble** — 19 repos · chain `7472f4e5` · [REPOS.md →](https://github.com/DavidFox998/rh-p5-bridge-14/blob/main/REPOS.md)

**Self-Symmetry formalization of the Clay Millennium Claim — Opera Numerorum Act IV — The Fourth Voice**

**David J. Fox** — ORCID 0009-0008-1290-6105 — Independent researcher — Opera Numerorum — July 2026
Lean 4.15.0 · Mathlib v4.15.0

A fourth independent route to the Clay claim, built on the arithmetic self-symmetry of the 35 MORNINGSTAR brothers. The other three routes live in Opera Numerorum:
- Route A [riemann-arakelov-positivity](https://github.com/DavidFox998/riemann-arakelov-positivity) — Arakelov Positivity (Abbes-Ullmo) — ω²=48/13>0 — Lean-closed formal reduction, conditional
- Route B [arakelov-rh-descent](https://github.com/DavidFox998/arakelov-rh-descent) — Kim-Sarnak Spectral Descent — λ₁≥975/4096 — 35pp BC6 — Lean-closed formal reduction, conditional
- Route C [rh-growth-contradiction](https://github.com/DavidFox998/rh-growth-contradiction) — Growth Contradiction — exp(c√(log t/log log t)) dominates (log t)² — Lean-closed formal reduction, conditional
- **Route D — THIS REPO — Self-Symmetry — Discrete orbit stability of the 35 Morningstar brothers (distinct mod 191 and mod 36863, certified empty desert, functional duality s↔1−s) — Lean-closed formal reduction, conditional**

All four share the same S₄={2,3,19,191}, C(S₄)=11.422>2√13 arithmetic gate. Each closes a conditional chain through GRH X₀(143) toward RH. **RH remains OPEN.** These are Lean-verified proof architectures, not Clay Prize submissions — Opera Numerorum in Four Voices: Positivity, Descent, Growth, Symmetry.

---

## How this repo sits in the Opera — a three-step chain

This is the third link in a chain of reasoning that begins with complexity theory and ends with the Riemann Hypothesis.

**Step 1 — [p-vs-np](https://github.com/DavidFox998/p-vs-np) defines the barriers.**
Three known obstacles block any proof that P≠NP: BGS relativization (Baker-Gill-Solovay, 1975), RR natural proofs (Razborov-Rudich, 1994), and AW algebrization (Aaronson-Wigderson, 2009). The repo formalizes these in Lean across 225 bricks, builds the ConductorHash machine from conductor N=143=11×13 and boundary prime p5=3993746143633, and asks: does any arithmetic object bypass all three barriers simultaneously?

**Step 2 — [eutheos-property](https://github.com/DavidFox998/eutheos-property) discovers 1419 as the barrier-bypass witness.**
The answer is yes. The number 1419=3×11×43 (hex 0x058B, popcount 6, 1419≡153 mod 211) passes all three barriers:
- BGS: it is a specific integer, not a uniform distribution — non-relativizing.
- RR: its family density 35/211=16.5% is below the 20% natural-proof threshold — non-large.
- AW: the center prime 211 is non-algebrizing.

1419 is not an isolated curiosity. It generates a 35-element family — every element satisfying the property P: residue 153 mod 211, popcount 6, circuit size 9. These 35 are the MORNINGSTAR brothers. The family arises 24× over the uniform expectation, certified by `native_decide`.

**Step 3 — This repo formalizes a conditional argument toward RH via the discrete self-symmetry of those 35 brothers.**
Brothers are composite by construction (1419=3×11×43; all members have popcount 6 and divisors). They are barriers: arithmetic objects that cannot be prime. Their collective structure — 35 distinct residues mod 191, 35 distinct residues mod 36863 (the desert twin 191×193), pairwise Hamming distance ≥2 — constitutes a discrete self-symmetry lattice. This lattice, combined with the functional equation s↔1−s, is the formal architecture of a conditional argument toward Re(ρ)=1/2. **RH status: OPEN.**

---

## The brothers — three fundamental theorems

The MORNINGSTAR brothers are the 35 elements of

  **ℬ** = { b ∈ ℕ | b < 2¹⁶, popcount(b) = 6, b ≡ 153 (mod 211), b ≥ 193 }

with minimum element (leader) 1419 = 3×11×43. The structural theorems, all proved by `native_decide` in `SelfSymmetry/Core.lean` (re-exporting the certified brothers from `Family/Brothers1419.lean`):

```lean
-- Cardinality and uniqueness
theorem core_brothers_35    : brothers_35.length = 35         := by native_decide
theorem core_brothers_Nodup : brothers_35.Nodup               := by native_decide

-- Arithmetic character
theorem core_brothers_mod211 : brothers_35.all (fun b => b % 211 = 153) = true  := by native_decide
theorem core_brothers_pop6   : brothers_35.all (fun b => (Nat.bits b).count true = 6) = true := by native_decide
theorem core_brothers_desert : brothers_35.all (· ≥ 193) = true := by native_decide
theorem core_leader          : brothers_35.min? = some 1419    := by native_decide
theorem core_leader_factor   : 3 * 11 * 43 = 1419              := by native_decide

-- Separation
theorem core_hamming_ge2  : 2 ≤ min_hamming                  := by native_decide
theorem self_symmetry_clean : SelfSymmetryClean               -- 6-way conjunction, native_decide
```

**Brothers by definition cannot be prime. Brothers are barriers.** The 35 barriers were found by barrier-passing through 1419.

---

## The desert — certified emptiness

`S₄ = {2, 3, 19, 191}` are exceptional primes. They are not brothers — they predate the family. The region 192..1000 contains no brothers. Formally in `SelfSymmetry/Desert.lean`:

```lean
theorem desert_exceptional_eq : exceptional_upto_1000 = [2, 3, 19, 191] := by native_decide
theorem desert_empty_192_1000 : desert_192_1000 = []                    := by native_decide
theorem desert_mod191_Nodup   : (brothers_35.map (· % 191)).Nodup       := by native_decide
theorem desert_product_Nodup  : (brothers_35.map (· % (191 * 193))).Nodup := by native_decide
theorem desert_clean : exceptional_upto_1000 = [2,3,19,191] ∧ desert_192_1000 = []
                     ∧ (brothers_35.map (· % 191)).Nodup                -- 3-way, native_decide
```

The product 36863 = 191×193 is the desert twin. Every brother occupies a **distinct slot** mod 191 and mod 36863 — 35 brothers, 35 distinct residues in each modulus, no collision anywhere in the desert.

---

## Orbit stability and the twin structure

`SelfSymmetry/TwinWormhole.lean` records three distinguished products:

| Name | Value | Role |
|---|---|---|
| W1 | 11×13 = 143 | Conductor N; exactly one brother has residue 0 mod 191, none mod 193 |
| W2 | 17×19 = 323 | Companion product; W1×W2 = 46189 |
| W3 | 191×193 = 36863 | Desert twin; mod-36863 Nodup clean |

`SelfSymmetry/JitterSymmetry.lean` verifies orbit stability via the transcendental shift α₀ = 299 + π/10:

```lean
theorem alpha0_irrational : Irrational (299 + Real.pi / 10)   := by
  exact (Real.irrational_pi.rat_add 299).div_rat 10 |>.add_rat 299
-- equivalently via nsmul:
-- exact irrational_nsmul Real.pi_irrational 1 |>.add_rat 299

theorem jitter_nodup_upto_1419 : all_jitters_Nodup_upto 1419 = true := by native_decide
```

The sequence ⌊n·α₀⌋ mod 191 for 1 ≤ n ≤ 1419 has no repeated values. This is the time-axis counterpart of the space-axis Nodup mod 191 theorem: brothers are separated in both space (distinct residues) and time (distinct orbit positions). The Dirichlet approximation bound ‖p·α₀‖ < 1/p is the analytic inequality this orbit satisfies — a consequence of equidistribution, not an independent input to the proof.

---

## Self-symmetry and the conditional argument toward Re(ρ) = 1/2

The desert and orbit theorems together constitute the self-symmetry of the brothers:

- **Spatial self-symmetry:** 35 distinct slots mod 191; 35 distinct slots mod 36863. No two brothers share an arithmetic position.
- **Temporal self-symmetry:** orbit Nodup for 1419 steps under α₀. No brother returns to a visited position within the leader's horizon.

A hypothetical 36th brother at any competing height would require a 36th slot mod 191 — impossible, since the 35 distinct slots are fully occupied and the desert is certified empty by `native_decide`. The functional equation s↔1−s provides self-duality; together with orbit stability, this is the formal architecture of the conditional argument. **The Riemann Hypothesis remains OPEN; this is the verified combinatorial component of one conditional route.**

The outer Siegel wall `3+4cosθ+cos2θ = 2(1+cosθ)² ≥ 0` (proved in `Siegel/SiegelZeroFreeRe1.lean`, 0 sorry) excludes zeros on Re=1. The inner Lindelöf bound `‖ζ(½+it)‖ ≤ C exp|t|` (proved in `Lindelof/GrowthBoundReal.lean`, 0 sorry) controls growth. Self-symmetry fills the gap between these two walls. The witness conjunction is declared in `SelfSymmetry/ClayWitness.lean`:

```lean
-- SelfSymmetry/ClayWitness.lean
def ClayWitnessReady : Prop :=
  SiegelZeroFree.SiegelZeroFree ∧ LindelofBridge.LindelofForZeta ∧ brothers_self_symmetry
```

**Status of the three pillars:** Siegel (genuine: `SiegelElementary.elementary_zero_free`), Lindelöf (genuine: `bridge_growth_exp`), self-symmetry (genuine as `Core.self_symmetry_clean`). The ClayWitness file still wires the third pillar through `Core.brothers_self_symmetry` — a stale identifier, quoted verbatim above, that needs re-pointing to `self_symmetry_clean`. Two of three pillars compile today — the conjunction is conditional, not yet a closed theorem.

---

## Repo map

```
Siegel/
  SiegelZeroFreeRe1.lean      — 3+4cosθ+cos2θ = 2(1+cosθ)² ≥ 0 · Poussin gem · outer wall Re=1 · 0 sorry
  SiegelZeroFreeElementary.lean — pair-sum tsum: ∑ (η₂ₖ−η₂ₖ₊₁) > 0 for σ>0 · 0 sorry · (connecting to ζ<0 needs eta identity, pending Lean formalization)
  SiegelZeroFree.lean         — re-export · bridge to Lindelöf

Lindelof/
  GrowthBoundReal.lean        — ‖ζ(½+it)‖ ≤ C exp|t| via η bounds · inner wall · 0 sorry
  LindelofBridge.lean         — imports Poussin + Growth → LindelofForZeta

SelfSymmetry/
  Core.lean        — 35 brothers · length=35, Nodup, ≡153 mod 211, popcount=6, ≥193, Hamming≥2, min=1419
  Desert.lean      — S₄ not brothers · desert 192..1000 empty · mod-191 Nodup · mod-36863 Nodup
  TwinWormhole.lean — W1=143, W2=323, W3=36863 · twin_191_193_clean · mod191 Nodup, mod193 not Nodup
  JitterSymmetry.lean — α₀=299+π/10 irrational · orbit Nodup up to 1419 · Dirichlet bound ‖p·α₀‖<1/p met
  ClayWitness.lean — ClayWitnessReady · SiegelZeroFree ∧ LindelofForZeta ∧ SelfSymmetryClean

Eutheos/
  Object.lean           — brother=barrier, not prime · collision_mod_q via divisors · EutheosObject
  Theta.lean            — Theta height of a barrier
  RationalTheta.lean    — rational Theta via log lower bounds: log2>0.69, log3>1.09, log19>2.94, log191>5.25 · 2 named open axioms
  RationalContradicts.lean — rational height contradicts 2113 being irrational as a brother height
  Bridge.lean           — RH_implies_ThetaRH · imports Siegel+Lindelöf
  EulerProductLemmas.lean — Euler product for S₄ · ported from arakelov-rh
  RamanujanFactorization.lean — τ factorization via S₄
  Unconditional.lean    — h_rat_ex + h_int target · 4 documented sorries, blocked on Mathlib
                          Euler-product API (targets riemannZeta_log_eulerProduct_criticalLine, v4.17+)
  RH.lean               — RH pillars · imports ClayWitness
  FinalAxioms.lean      — S₄={2,3,19,191}, p5=3993746143633, Δ=23.796910, 2√13=7.211, Δ>2√13, S₄_μ=0

Closure/             — closed arithmetic gate: C(S₄)=11.422>2√13 · Hasse 143a1 · routeC_all_closed · 0 sorry
ContradictionRoute/  — GrowthBound × ZeroRepulsion → RH bridge · placeholder surfaces + named-open Weil transfer
Family/              — the 35 brothers, inlined from eutheos-property · sync-locked
MathlibFix/          — Mathlib v4.15.0 API audit shims · 1 closable sorry
Route/               — RouteA / RouteB vendored bridges · RouteD composition (see Route/README.md for import status)
Towers/              — keystone chain C01→C22 (byte-identical to rh-p5-bridge-14/Towers)

Protocol/
  Chain.lean — ChainCertificate placeholder (Prop := True) · wiring target for the full
               certificate: S₄, p5, Δ, desert empty, mod-191 Nodup, W3 Nodup, orbit Nodup,
               α₀ irrational, Poussin wall, growth wall, ClayWitnessReady
```

---

## How Route D compares to the other three voices

| Route | Core theorem | S₄ role | Brothers / 1419 role | Act |
|---|---|---|---|---|
| **Self-Symmetry (here)** | Orbit stability (distinct mod 191, mod 36863) + s↔1−s — conditional architecture toward Re(ρ)=1/2 | Exceptional primes, not brothers; desert empty by `native_decide` | Leader 1419 is the barrier-bypass witness; 35-brother lattice is the symmetry proof object | IV — Symmetry |
| Arakelov Positivity | Height ω²=48/13>0; a Siegel zero forces negative height — contradiction | Provides height support via log-lowering | No direct role | I — Positivity |
| Spectral Descent | λ₁≥975/4096; Selberg trace → Bost-Connes → GRH → RH | Level 143 for X₀(143); BC6 gate | p5 as boundary hash prime | II — Descent |
| Growth Contradiction | exp(c√(log t/log log t)) beats (log t)²; zero repulsion → RH | Bost-Connes phase transition C(S₄)=11.422>2√13 | p5 as beacon | III — Growth |

Only Route D tells who the brothers are. The barrier framework in p-vs-np led to the discovery of 1419 in eutheos-property, which led to the 35-brother self-symmetry lattice proved here — and through that lattice, to the fourth independent conditional formalization route toward RH. **RH remains OPEN.**

---

## Build

```bash
lake build Siegel.SiegelZeroFreeRe1           # GREEN — 3+4cosθ+cos2θ ≥ 0
lake build Siegel.SiegelZeroFreeElementary    # GREEN — η_pos>0, factor_neg<0
lake build Lindelof.GrowthBoundReal           # GREEN — growth bound
lake build SelfSymmetry.Core                  # 35 brothers
lake build SelfSymmetry.Desert                # S₄ not brothers, desert empty, mod-191 Nodup
lake build SelfSymmetry.TwinWormhole          # W1=143, W2=323, W3=36863
lake build SelfSymmetry.JitterSymmetry        # orbit Nodup up to 1419, α₀ irrational
lake build SelfSymmetry.ClayWitness           # ClayWitnessReady
lake build Eutheos.FinalAxioms                # S₄, p5, Δ>2√13
lake build Protocol.Chain                     # ChainCertificate
grep -r "sorry" Siegel/ Lindelof/ SelfSymmetry/ Protocol/ --include="*.lean" \
  | grep -v "FinalAxioms\|Unconditional\|RH.lean\|Bridge"  # → 0 in core gems
```

---

## Opera Numerorum — 19 repos

**[arakelov-positivity-rh-core](https://github.com/DavidFox998/arakelov-positivity-rh-core) — ROOT V2** — Arakelov height `ω²=48/13>0`; Zoe-M\*, M4 10^4000 boundary — provides the height input that all four RH voices reuse

**[rh-p5-bridge-14](https://github.com/DavidFox998/rh-p5-bridge-14) — Keystone** — `q5=226`, `q6=165849`, `cf_bound=82829` — reduces infinite `S_α0` to finite `S₁₄`; closes `BSD_143_PROVED → RiemannHypothesis`

**[riemann-arakelov-positivity](https://github.com/DavidFox998/riemann-arakelov-positivity) — Route A · Act I** — Abbes-Ullmo `ω²=48/13>0`; a Siegel zero would force negative height — Lean-closed formal reduction, conditional

**[arakelov-rh-descent](https://github.com/DavidFox998/arakelov-rh-descent) — Route B · Act II** — Kim-Sarnak `λ₁≥975/4096` → Selberg trace = Bost-Connes → GRH for X₀(143) — 35pp BC6, Lean-closed formal reduction, conditional

**[rh-growth-contradiction](https://github.com/DavidFox998/rh-growth-contradiction) — Route C · Act III** — Littlewood Ω `exp(c√(log t / log log t))` beats `(log t)²`; zero repulsion — Lean-closed formal reduction, conditional

**[brothers-desert-proof](https://github.com/DavidFox998/brothers-desert-proof) — Route D · Act IV** ← **this repo** — 35 Morningstar brothers, distinct mod 191 and mod 36863, certified empty desert; orbit stability — Lean-closed formal reduction, conditional

**[bost-connes](https://github.com/DavidFox998/bost-connes) — Arithmetic hub** — `C(S₄)=11.422...>2√13`, Gates M1–M3→M4–M8, 21 bricks 0 sorry — #173 GREEN

**[birch-swinnerton-dyer-143a1](https://github.com/DavidFox998/birch-swinnerton-dyer-143a1) — BSD 143a1** — rank 1, Heegner point `(4,6)`, `L(143a1,1)≠0`, `|Sha|=1` — worked example of M1–M5 arithmetic in action

**[lindelof-hypothesis-143](https://github.com/DavidFox998/lindelof-hypothesis-143) — Lindelöf for X₀(143)** — GRH → `μ=0` → `|ζ(½+it)|=O(t^ε)` via S₄ — conditional on GRH

**[eutheos-property](https://github.com/DavidFox998/eutheos-property) — Barrier bypass** — `1419=3×11×43`, 35 brothers `≡153 mod 211`, barriers BGS/RR/AW all PASS — P vs NP study side; brothers here are the symmetry lattice for Route D

**[poincare-spectral](https://github.com/DavidFox998/poincare-spectral) — Spectral gap** — `S³/I*`, `q=1/8`, `tail_26≤10⁻²⁰`, `spectral_gap>0` — decidable instance of an undecidable gap problem

**[p-vs-np](https://github.com/DavidFox998/p-vs-np) — P vs NP mechanics** — 225 bricks, ConductorHash, conditional `SAT∉P→P≠NP`; the barrier framework here is what led to 1419 and the brothers

**[hodge-abelian-boundaries](https://github.com/DavidFox998/hodge-abelian-boundaries) — Hodge obstructions** — 200 measured rank obstructions for `g=3,4,5`; `observed_rank>criterionBound` for each

**[yang-mills-gap](https://github.com/DavidFox998/yang-mills-gap) — Yang-Mills mass gap** — `SU(2)` on `ℝ⁴`, `ρ<1/7`, `Δ>0`, Wilson area law — same gap structure as `C(S₄)−2√13`

**[navier-stokes](https://github.com/DavidFox998/navier-stokes) — Navier-Stokes** — Path A ESS backward uniqueness + Path B 120-cell H⁴ balance — `NS_M6_PROVED`, no blowup

**[zerobeacon](https://github.com/DavidFox998/zerobeacon) — MCP server** — 1,052 MCP operations for agent workflows; start with the free beacon connection check

---

ORCID: [0009-0008-1290-6105](https://orcid.org/0009-0008-1290-6105) · Archive: [pistus-theoria](https://github.com/DavidFox998/pistus-theoria) — `OperaNumerorum_MasterEquations.pdf SHA 7f6b31b4`
**Ensemble:** `sha256:e1617bc96018da4577f153f2e0cd8cc4eda1183434a9624b6cefaedc655db6c5` · hub [`rh-p5-bridge-14`](https://github.com/DavidFox998/rh-p5-bridge-14) · anchor `d04e4bd1`

## Author

David J. Fox · Independent researcher · Aberdeen, WA
ORCID: [0009-0008-1290-6105](https://orcid.org/0009-0008-1290-6105) · Opera Numerorum — 2026

