# scripts/ — Opera Numerorum Referee & Maintenance Pipeline

Operational scripts — the verification and ensemble-hygiene tooling for this repo and the 19-repo ensemble.

| Script | Role |
|---|---|
| `audit.sh` | **Uniform Referee Verification Pipeline** (V1–V5): `lake build`, comment-aware `sorry` scan, `noncomputable` count, external-import check, SHA-256 source certification — over any repo directory; generates `CERT_LOG.md` content |
| `check_ensemble_links.sh` | Parses `REPOS.md`, fetches all 19 member READMEs from GitHub, verifies each carries the back-link to the keystone [rh-p5-bridge-14](https://github.com/DavidFox998/rh-p5-bridge-14) |
| `lean-compat-check.sh` | Rebuilds the three Siegel modules after a Lean/Mathlib refresh and classifies failures into API-NORMALIZATION vs other buckets |
| `test-lean-compat-check.sh` | Fixture-based tests for the classifier above |
| `post-merge.sh` | Post-merge setup stub (lake fetches dependencies on build) |

CI wiring: `.github/workflows/lean.yml` builds `Siegel.SiegelZeroFreeElementary` per commit; `main.yml` builds the SelfSymmetry, Eutheos, and ContradictionRoute targets; `ensemble-links.yml` runs the back-link audit weekly.
