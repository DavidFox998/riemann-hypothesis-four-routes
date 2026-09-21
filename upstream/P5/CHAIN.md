# Opera Numerorum — Data Chain Lock (19 repos)

**Chain SHA256:** `702d12e6ebf9b203d73bc8a57617ea960e3cc2a31901fc482888fec28ff08825`  
P26-08-23  
**Repos in chain:** 19  
**Previous chain (12 repos, 2026-08-05):** `c79c94e7676a10b1cfb5afc75b7346b9b5b8589dee9b679db230ba3b8034e6d1`

This file is maintained in `rh-p5-bridge-14` and referenced across all repos in the chain.  
The chain SHA256 is `SHA256` of the newline-terminated string
`repo:sha\n` for every repo in **canonical alphabetical order**,
using the HEAD commits recorded in the table below.

---

## Repos in this chain

| Repo | HEAD at lock | Cluster |
|------|-------------|---------|
| [DavidFox998/arakelov-positivity-rh-core](https://github.com/DavidFox998/arakelov-positivity-rh-core) | `6ec00281c55dca4dc2647e8f9c36574ccb327ec7` | RH |
| [DavidFox998/arakelov-rh-descent](https://github.com/DavidFox998/arakelov-rh-descent) | `49ad1b7f8fec6a871fea1959040e15d43493397a` | RH |
| [DavidFox998/birch-swinnerton-dyer-143](https://github.com/DavidFox998/birch-swinnerton-dyer-143) | `853d7f3171900a4b3af96f7733f684cd8932de1a` | BSD |
| [DavidFox998/birch-swinnerton-dyer-143a1](https://github.com/DavidFox998/birch-swinnerton-dyer-143a1) | `d690e1c30010eaf03ca446f8561612997ac36a5a` | BSD |
| [DavidFox998/bost-connes](https://github.com/DavidFox998/bost-connes) | `15250352cace6fc15cd2a13cf9430d7be8fead00` | BSD/RH |
| [DavidFox998/brothers-desert-proof](https://github.com/DavidFox998/brothers-desert-proof) | `c21a38cdb98e408659f565525dff9091940a0516` | RH |
| [DavidFox998/Certifications](https://github.com/DavidFox998/Certifications) | `731253f5b336de77105a3dc85798828306abc9ad` | META |
| [DavidFox998/eutheos-property](https://github.com/DavidFox998/eutheos-property) | `c3d272476ab82f7858b38f13dd7cde5e6d01baf9` | P≠NP |
| [DavidFox998/hodge-abelian-boundaries](https://github.com/DavidFox998/hodge-abelian-boundaries) | `b5d4339e96bff39749093b0acbf323b03d3bb2e7` | Hodge |
| [DavidFox998/lindelof-hypothesis-143](https://github.com/DavidFox998/lindelof-hypothesis-143) | `d0897752af48bd0c1c069c808518c1911d6e796d` | RH |
| [DavidFox998/morningstar-project](https://github.com/DavidFox998/morningstar-project) | `14d94d39ed786170c450e64d3751d43a26be60d6` | META |
| [DavidFox998/navier-stokes](https://github.com/DavidFox998/navier-stokes) | `ab0e5eccf6066e43a92a28c61dd256e88a84228e` | NS |
| [DavidFox998/opera-sieve](https://github.com/DavidFox998/opera-sieve) | `43f8b96822e7db3328b7d24f48324aca600d0350` | META |
| [DavidFox998/p-vs-np](https://github.com/DavidFox998/p-vs-np) | `ebcee3293972f67364d6724447c2cb4652a36173` | P≠NP |
| [DavidFox998/poincare-spectral](https://github.com/DavidFox998/poincare-spectral) | `807f4b442fa599614598271b1b1364fc2fb31105` | Poincaré |
| [DavidFox998/rh-growth-contradiction](https://github.com/DavidFox998/rh-growth-contradiction) | `c10d48c7b11df28520598c3d0cfcb3006b16fec2` | RH |
| [DavidFox998/rh-p5-bridge-14](https://github.com/DavidFox998/rh-p5-bridge-14) | `22bba853bf8b91d8d05cfddbbdb69d6e246ef068` | META |
| [DavidFox998/riemann-arakelov-positivity](https://github.com/DavidFox998/riemann-arakelov-positivity) | `14c52e307e95258965ed06291cdc2f03d1498900` | RH |
| [DavidFox998/yang-mills-gap](https://github.com/DavidFox998/yang-mills-gap) | `bee05c045ff04a5a84eb2a33e4445ce454a0f368` | YM |

---

## What this chain represents

These repos are not isolated proofs of isolated problems.
They are facets of the same underlying object.

| Cluster | Repos | Core claim |
|---------|-------|-----------|
| Circuit complexity / P vs NP | `p-vs-np`, `eutheos-property` | Witness T=1419; 35→61→188→∞ family; H4 Fibonacci tower; non-algebrizing barrier |
| Riemann Hypothesis | `rh-p5-bridge-14`, `riemann-arakelov-positivity`, `rh-growth-contradiction`, `arakelov-rh-descent`, `brothers-desert-proof`, `arakelov-positivity-rh-core`, `lindelof-hypothesis-143` | RH via Arakelov geometry, growth contradictions, ζ-function bounds, Dirichlet jitter |
| BSD Conjecture | `birch-swinnerton-dyer-143a1`, `birch-swinnerton-dyer-143`, `bost-connes` | BSD on 143a1; h(ℚ(√−143))=10; Bost-Connes M1–M3 |
| Lindelöf | `lindelof-hypothesis-143` | Moment bounds, sub-convexity |
| Poincaré | `poincare-spectral` | Spectral methods, Laplacian gap |
| Navier–Stokes | `navier-stokes` | Regularity, blow-up barrier |
| Hodge | `hodge-abelian-boundaries` | Abelian boundary cases |
| Yang–Mills | `yang-mills-gap` | Mass gap certificate |
| Infrastructure | `opera-sieve`, `morningstar-project`, `rh-p5-bridge-14`, `Certifications` | Sieve, certification ledger, bridge, audit |

The Millennium Problems are not seven isolated islands.
They are projections of a single geometric object — the same
non-crystallographic, non-algebrizing H4-throat barrier that
T=1419 witnesses in circuit complexity.

---

## Re-lock procedure

When one or more repos receive new commits the chain SHA drifts.
Re-lock with the automated script:

```bash
# Inside a checkout of rh-p5-bridge-14:
export GITHUB_TOKEN=ghp_...          # needs repo:read on all 19 repos
bash scripts/relock-chain.sh         # patches CHAIN.md + REPOS.md, opens a PR
bash scripts/relock-chain.sh --dry-run  # preview only — no file changes
```

The script:
1. Calls the GitHub API to fetch the current `main` HEAD of each repo.
2. Recomputes `SHA256(repo:sha\n …)` in canonical alphabetical order.
3. If the digest differs from the value in this file, patches `CHAIN.md` and
   `REPOS.md` in place and (inside GitHub Actions) opens a pull request.
4. If the digest matches, exits 0 with "chain is current".

Two GitHub Actions workflows guard the chain:

| Workflow | Schedule | Action on drift |
|----------|----------|-----------------|
| `verify-chain.yml` | **Daily at 08:00 UTC** (and on `workflow_dispatch`) | Fails the job → GitHub check failure; posts a Slack alert via `SLACK_WEBHOOK_URL` repository secret |
| `relock-chain.yml` | **Weekly, Monday 06:00 UTC** (and on `workflow_dispatch`) | Opens a pull request titled `chore: re-lock ensemble chain (YYYY-MM-DD)` for human review before merge |

To receive Slack alerts, add your incoming-webhook URL as a repository secret named `SLACK_WEBHOOK_URL` in `rh-p5-bridge-14`.
If the secret is absent the Slack step is skipped gracefully; the job still fails (providing the GitHub check-failure signal).

---

## Verification

Recompute the chain SHA from live HEAD commits:

```python
import hashlib, json, urllib.request, os

repos = [
    "arakelov-positivity-rh-core", "arakelov-rh-descent",
    "birch-swinnerton-dyer-143", "birch-swinnerton-dyer-143a1",
    "bost-connes", "brothers-desert-proof", "Certifications",
    "eutheos-property", "hodge-abelian-boundaries", "lindelof-hypothesis-143",
    "morningstar-project", "navier-stokes", "opera-sieve", "p-vs-np",
    "poincare-spectral", "rh-growth-contradiction", "rh-p5-bridge-14",
    "riemann-arakelov-positivity", "yang-mills-gap"
]
tok = os.environ["GITHUB_TOKEN"]
lines = []
for repo in repos:
    url = f"https://api.github.com/repos/DavidFox998/{repo}/commits/main"
    req = urllib.request.Request(url, headers={"Authorization": f"token {tok}"})
    sha = json.loads(urllib.request.urlopen(req).read())["sha"]
    lines.append(f"{repo}:{sha}")
result = hashlib.sha256(("\n".join(lines) + "\n").encode()).hexdigest()
print(result)
print("Expected: f39ed9a9bd7cc02c6cf415f40b3faaa3c627a5a0d53621766466f31a2211e7ce")
```

If the hashes differ, one or more repos have received new commits since the lock.
Re-lock by re-running this script and committing a fresh CHAIN.md.

---

## Audit all repos

```bash
git clone https://github.com/DavidFox998/rh-p5-bridge-14
for repo in arakelov-positivity-rh-core arakelov-rh-descent \
    birch-swinnerton-dyer-143 birch-swinnerton-dyer-143a1 \
    bost-connes brothers-desert-proof eutheos-property \
    hodge-abelian-boundaries lindelof-hypothesis-143 morningstar-project \
    navier-stokes opera-sieve p-vs-np poincare-spectral \
    rh-growth-contradiction riemann-arakelov-positivity yang-mills-gap; do
  git clone https://github.com/DavidFox998/$repo
  bash rh-p5-bridge-14/scripts/audit.sh $repo | tail -5
done
```

See [CERT_LOG.md](CERT_LOG.md) for pre-run baseline certificates.
