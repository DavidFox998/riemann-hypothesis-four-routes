# Family — The 35 Brothers (inlined from eutheos-property)

The arithmetic heart of Route D. These files are **sync-locked inlines of [eutheos-property/Family](https://github.com/DavidFox998/eutheos-property)** — that repo is the canonical source; this folder is the Route D copy.

## Overview

The 35 Morningstar brothers: every one satisfies `n % 211 = 153` and has popcount 6, with leader `1419 = 3×11×43`. Route D uses their orbit structure as the discrete self-symmetry lattice:

- **`Brothers1419.lean`** — the core list `brothers_35 : List Nat` and its certificates: `all_brothers_residue_153`, `brothers_Nodup`, `brothers_card_35`, `all_brothers_popcount_6`, `density_35_lt_one_fifth` (35/211 < 1/5), `density_35_in_slice` (35/C(16,6) = 35/8008), plus the conductor constants `p5 = 3993746143633`, `N_conductor = 143 = 11*13`, `phi_conductor = 120`, `g = 13`, `h = 10`. 31 of 35 need ≥ 8 gates (`brothers_not_in_S7`).
- **`BrothersAnalysis.lean`** — `prime_brothers = [5639, 9859, 44041]`, `leader_is_morningstar : 3*11*43 = 1419`.
- **`GapHamming.lean`** — distinct residues: `gap_191_pos`, `gap_36863_pos` (mod 36863 = 191×193), `gap_193_collision`, and **`hamming_ge_2`** — pairwise Hamming distance ≥ 2.
- **`TwinPrimes.lean`** — twin-prime avoidance: divisibility counts for (11,13), (17,19), (191,193); `mod_191_Nodup`, `mod_191_193_product_Nodup`.
- **`ExceptionalPrimes.lean`** — `exceptional_4 = [2,3,19,191]` (S₄), `desert_product = 21774`, `wormhole_product = 46189`, `brothers_in_desert` (all > 191, where V(p) > 0).
- **`PrimesInPi.lean`** — α₀ = π/10 scaffold (`alpha0_num = 3141592653 / alpha0_den = 10^10`): among primes ≤ 1000 exactly S₄ is exceptional (`exceptional_upto_1000_eq`) and the desert 192..1000 is **empty** (`desert_192_1000_empty`).

## Files

| File | Role |
|---|---|
| `Brothers1419.lean` | `brothers_35` + residue/popcount/cardinality/density/conductor certificates |
| `BrothersAnalysis.lean` | primality split, Morningstar leader identification |
| `GapHamming.lean` | min gaps 191 / 36863, Hamming ≥ 2 |
| `TwinPrimes.lean` | twin-prime divisibility avoidance, mod-191 injectivity |
| `ExceptionalPrimes.lean` | S₄ exceptional primes, desert/wormhole products |
| `PrimesInPi.lean` | α₀ = π/10 rational scaffold, empty desert 192..1000 |

Sync-lock headers: "inlined from eutheos-property/Family/…" — do not edit here; edit upstream and re-sync.

## Status

0 sorry, 0 axiom; all finite facts `native_decide`-certified.

## Upstream / Downstream

Upstream: [p-vs-np](https://github.com/DavidFox998/p-vs-np) (barrier framework that led to 1419) → [eutheos-property](https://github.com/DavidFox998/eutheos-property) (canonical Family). Downstream: [SelfSymmetry/](../SelfSymmetry/README.md) (the Route D orbit structure built on this lattice) and [Route/RouteD.lean](../Route/README.md).
