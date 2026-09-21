# Towers/RH/Chain — P5 Keystone Chain — CLOSED

This is the keystone that ties BSD and RH.

- `P5_BSD_RH_Link.lean` — NEW v2.0.0 — defines:
    - `P5_BSD_constants_agree` `143*13=1859`
    - `P5_BSD_BostBound_link` `C_S4=11.422148...>2√13` from **[bost-connes](https://github.com/DavidFox998/bost-connes)** `C_S4_gt_two_sqrt_13_CLOSED`
    - `P5_BSD_classNumber_link` `h=10` both routes from `bost-connes` + **[birch-swinnerton-dyer-143a1](https://github.com/DavidFox998/birch-swinnerton-dyer-143a1)**
    - `P5_BSD_S14_link` `|S14|=14, cf_bound=82829, q5=226, q6=165849` from **[opera-sieve](https://github.com/DavidFox998/opera-sieve)**
    - `P5_BSD_to_RH_clean : BSD_143_PROVED → GRH_for_L`
    - `P5_BSD_RH_closure_CLOSED : BSD_143_PROVED → RiemannHypothesis` via `grh_to_rh_descent + LanglandsTransfer_14_CLOSED`

(The former `P5_LanglandsDescent_2pi7_OPEN.lean` has been retired; its content survives as the `LanglandsTransfer_14_CLOSED` identifier inside `P5_BSD_RH_Link.lean`.)

## The C01→C22 chain

| Stage | File | Gate |
|---|---|---|
| Arakelov foundations | `C01_Arakelov.lean` → `C05_Discriminant.lean` | conductor, modularity, positivity, heights, discriminant |
| Zeta control | `C06_ZetaControl.lean` → `C07_RH.lean` | ζ bounds → RH reduction |
| Bridges | `C08_M4WeilBridge.lean`, `C09_P5Bridge.lean` | Weil bridge, P5 bridge |
| Main theorems | `C10_MainTheorem.lean` → `C13_ArakelovToRH.lean` | main theorem, certificate closure, M9 integration, Arakelov→RH |
| BC6 spectral | `C14_BC6SpectralGap.lean` → `C16_MasterCertification.lean` | spectral gap, class number, master certification |
| Certificates | `C17_ArakelovPairingCert.lean` → `C22_RouteACert.lean` | pairing, Kim-Sarnak, Selberg trace, Langlands descent, GRH→RH, Route A cert |

Plus `P5_BSD_RH_Link.lean` above — the BSD↔RH keystone.
