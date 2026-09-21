# Towers/RH/Formalized

The formalized sieve and the H4 module ladder — the deepest layer of the bridge from the infinite exceptional set to the finite certificate.

Core:

- `Sieve_Criterion.lean` — defines `S_α0` infinite set and reduction to finite `S_14` with `cf_bound = 82829`. Implements `q5 = 226, q6 = 165849`. From **[opera-sieve](https://github.com/DavidFox998/opera-sieve)** methodology.

Modules (the ladder):

- `Module_10_Genus33.lean` — genus 33 expansion step
- `Module_14_S4_Quaternions.lean` — S₄ quaternions
- `Module_15_Delta_Boost.lean` — Δ boost
- `Module_16_c_Bridge.lean` — c-bridge
- `Module_18_Resonance_Ladder.lean` — resonance ladder
- `Module_21_H4_Invariant.lean` — H4 Coxeter invariant M* = 12/11 (see [pistus-theoria](../../../pistus-theoria/README.md))
- `Module_24_ZLock.lean` — ZLock, N_routes = 108

Certificates and chain:

- `Bands_269_Certificate.lean`, `Boundary_Theorem.lean`, `Certificates.lean`, `C_Chain.lean`, `C01_Arakelov_v2.lean`
- `Addendum_A1_Complete_Sieve.lean`, `Exceptional_Prime_Desert_Map.lean`, `Modular_Sieve_Lindelof.lean`, `Data_Registry.lean`

From **[opera-sieve](https://github.com/DavidFox998/opera-sieve)** methodology; consumes the H4 invariant archived in the ensemble's [pistus-theoria](https://github.com/DavidFox998/pistus-theoria) archive.
