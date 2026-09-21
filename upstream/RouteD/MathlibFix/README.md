# MathlibFix — Mathlib v4.15.0 API Audit Shims

Vendor shims that pin the exact Mathlib v4.15.0 API surface this repo uses, and audit which expected names exist.

## Overview

`ComplexLogFix.lean` (113 lines) wraps the proved Mathlib lemmas the chain needs:

- `complex_log_exp_eq` (wraps `Complex.log_exp`)
- `log_mul_fix` (wraps `Complex.log_mul`)
- `arg_continuous_fix` (wraps `Complex.continuousOn_arg`)
- `zeta_ne_zero_of_one_lt_re` (wraps `riemannZeta_ne_zero_of_one_lt_re`)
- `zeta_log_bound` — **1 marked sorry** ("CLOSABLE: LSeries_eulerProduct_exp_log (trivial char) + norm_tsum_le_tsum_norm")

The file also documents what is **absent** from Mathlib v4.15.0: `riemannZeta_eta`, `riemannZeta_eulerProduct` do not exist under those names, and "ZetaRealSign cannot be closed in v4.15.0" — which is why `Route/RouteD.lean`'s reference to `ZetaRealSign` does not resolve (see [Route/README.md](../Route/README.md)).

## Files

| File | Role |
|---|---|
| `ComplexLogFix.lean` | Proved wrappers + 1 closable gap + absent-API audit |

## Status

5 proved wrappers, 1 documented closable `sorry` (`zeta_log_bound`). This is the only first-party sorry outside `Eutheos/Unconditional.lean` — tracked, labeled, not hidden.

## Why a folder for one file

Compatibility shims age; giving them a named home (`MathlibFix/`) makes Mathlib refreshes auditable — see `scripts/lean-compat-check.sh` for the automated API-compatibility check.
