# Protocol — The Chain Certificate Target

The final lock: one certificate tying Siegel + Lindelöf + SelfSymmetry + Eutheos into a single chain.

## Current state — be precise

`Chain.lean` is currently a **7-line placeholder**:

```lean
namespace Chain
def ChainCertificate : Prop := True
theorem chain_closed : ChainCertificate := trivial
end Chain
```

The *intended* certificate — the structure it will grow into — is the rich form: S₄ = {2,3,19,191}, P5 = 3993746143633, Δ = 23.79 > 2√13 = 7.21, `desert_exceptional_eq` (only S₄ exceptional up to 1000), `desert_empty_192_1000`, `desert_mod191_Nodup`, mod-36863 Nodup, `jitter_Nodup_1419`, `jitter_alpha0_irrational`, Poussin wall `∀ θ, 0 ≤ 3+4cosθ+cos2θ`, growth wall `‖ζ(½+it)‖ ≤ C·exp|t|`, and `ClayWitnessReady`. Every field of that structure already has a proved source elsewhere in this repo — the work remaining is assembling them into the structure (see the [root README repo map](../README.md#repo-map)).

The claims `chain_complete`, and the `Final.lean`/`Witness.lean` re-exports, are **not in the tree** — this README previously described that aspirational form as if built. It is not. The genuine closed results live in [Closure/](../Closure/README.md) (`routeC_all_closed`) and the Siegel/Lindelöf walls.

## Files

| File | Role |
|---|---|
| `Chain.lean` | Placeholder certificate + `chain_closed` — wiring target |

## Build

`lake build Protocol.Chain` — green (trivially). Referenced by CI `main.yml`.

## Consumers

`Eutheos/RH.lean` imports the ClayWitness; the full certificate chain routes through here once assembled. Why 1419: leader + barrier-passing number + jitter bound + chain-closure horizon — the number where all certificates align.
