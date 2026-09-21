#!/usr/bin/env bash
# scripts/relock-chain.sh — Recompute and re-lock the Opera Numerorum ensemble chain.
#
# Usage:
#   bash scripts/relock-chain.sh           # recompute, patch files, open PR (in CI)
#   bash scripts/relock-chain.sh --dry-run # print new SHA without changing files
#
# Requires: GITHUB_TOKEN or GH_TOKEN in environment (repo:read scope on all 19 repos).
# In CI: also needs contents:write and pull-requests:write (set in workflow permissions).

set -euo pipefail

DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

python3 - "$DRY_RUN" <<'PYEOF'
import sys, os, hashlib, json, urllib.request, urllib.error, re, subprocess
from datetime import date, datetime

dry_run = sys.argv[1] == "true"
token = os.environ.get("GITHUB_TOKEN") or os.environ.get("GH_TOKEN") or ""
if not token:
    print("ERROR: GITHUB_TOKEN or GH_TOKEN must be set", file=sys.stderr)
    sys.exit(1)

OWNER = "DavidFox998"
# Canonical alphabetical order — must stay in sync with CHAIN.md
REPOS = [
    "arakelov-positivity-rh-core",
    "arakelov-rh-descent",
    "birch-swinnerton-dyer-143",
    "birch-swinnerton-dyer-143a1",
    "bost-connes",
    "brothers-desert-proof",
    "Certifications",
    "eutheos-property",
    "hodge-abelian-boundaries",
    "lindelof-hypothesis-143",
    "morningstar-project",
    "navier-stokes",
    "opera-sieve",
    "p-vs-np",
    "poincare-spectral",
    "rh-growth-contradiction",
    "rh-p5-bridge-14",
    "riemann-arakelov-positivity",
    "yang-mills-gap",
]

def gh_get(path):
    req = urllib.request.Request(
        f"https://api.github.com{path}",
        headers={
            "Authorization": f"token {token}",
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28",
        }
    )
    with urllib.request.urlopen(req) as r:
        return json.loads(r.read())

def gh_post(path, body):
    req = urllib.request.Request(
        f"https://api.github.com{path}",
        data=json.dumps(body).encode(),
        headers={
            "Authorization": f"token {token}",
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28",
            "Content-Type": "application/json",
        },
        method="POST",
    )
    with urllib.request.urlopen(req) as r:
        return json.loads(r.read())

# ── 1. Fetch HEAD SHAs ───────────────────────────────────────────────────────
print(f"Fetching HEAD SHAs for {len(REPOS)} repos…")
shas = {}
for repo in REPOS:
    data = gh_get(f"/repos/{OWNER}/{repo}/commits/main")
    sha = data["sha"]
    shas[repo] = sha
    print(f"  {repo}: {sha[:12]}")

# ── 2. Compute new chain SHA ─────────────────────────────────────────────────
lines = [f"{repo}:{shas[repo]}" for repo in REPOS]
new_sha = hashlib.sha256(("\n".join(lines) + "\n").encode()).hexdigest()
print(f"\nNew chain SHA256: {new_sha}")

with open("CHAIN.md") as f:
    chain_content = f.read()

old_sha_m = re.search(r'\*\*Chain SHA256:\*\* `([0-9a-f]{64})`', chain_content)
old_sha = old_sha_m.group(1) if old_sha_m else ""
print(f"Old chain SHA256: {old_sha}")

if new_sha == old_sha:
    print("\nChain is current — no drift detected. Exiting 0.")
    sys.exit(0)

print("\nDrift detected — chain needs re-locking.")

if dry_run:
    print("[DRY RUN] Would patch CHAIN.md + REPOS.md and open a PR. Exiting without changes.")
    sys.exit(0)

today = date.today().isoformat()

# ── 3. Patch CHAIN.md ────────────────────────────────────────────────────────
new_chain = chain_content

# Update chain SHA header line
new_chain = re.sub(
    r'(\*\*Chain SHA256:\*\* )`[0-9a-f]{64}`',
    rf'\1`{new_sha}`',
    new_chain,
)
# Update lock date
new_chain = re.sub(
    r'(\*\*Locked:\*\* )\S+',
    rf'\1{today}',
    new_chain,
)
# Update each repo's SHA in the table (full 40-char SHA)
for repo in REPOS:
    sha = shas[repo]
    new_chain = re.sub(
        rf'(\| \[DavidFox998/{re.escape(repo)}\]\([^)]+\) \| )`[0-9a-f]{{40}}`',
        rf'\1`{sha}`',
        new_chain,
    )

with open("CHAIN.md", "w") as f:
    f.write(new_chain)
print("Patched CHAIN.md")

# ── 4. Patch REPOS.md ────────────────────────────────────────────────────────
with open("REPOS.md") as f:
    repos_content = f.read()

new_repos = repos_content

# Update chain SHA header line
new_repos = re.sub(
    r'(\*\*Ensemble chain SHA256:\*\* )`[0-9a-f]{64}`',
    rf'\1`{new_sha}`',
    new_repos,
)
# Update lock date (leave the "(19 repos — see …)" suffix intact)
new_repos = re.sub(
    r'(\*\*Chain locked:\*\* )\S+',
    rf'\1{today}',
    new_repos,
)
# Update 12-char HEAD short-SHAs in the per-repo table rows
for repo in REPOS:
    short = shas[repo][:12]
    new_repos = re.sub(
        rf'(.*\[{re.escape(repo)}\].*\| )`[0-9a-f]{{12}}`(\s*\|)',
        rf'\1`{short}`\2',
        new_repos,
    )

with open("REPOS.md", "w") as f:
    f.write(new_repos)
print("Patched REPOS.md")

# ── 5. Commit and push a branch ──────────────────────────────────────────────
branch = f"chain-relock/{datetime.utcnow().strftime('%Y%m%d-%H%M%S')}"

run = lambda *args, **kw: subprocess.run(list(args), check=True, **kw)
run("git", "config", "user.email", "41898282+github-actions[bot]@users.noreply.github.com")
run("git", "config", "user.name", "github-actions[bot]")

remote_url = f"https://x-access-token:{token}@github.com/{OWNER}/rh-p5-bridge-14.git"
run("git", "remote", "set-url", "origin", remote_url)

run("git", "checkout", "-b", branch)
run("git", "add", "CHAIN.md", "REPOS.md")
run("git", "commit", "-m", f"chore: re-lock ensemble chain ({today})")
run("git", "push", "origin", branch)
print(f"Pushed branch '{branch}'")

# ── 6. Open pull request ─────────────────────────────────────────────────────
pr = gh_post(
    f"/repos/{OWNER}/rh-p5-bridge-14/pulls",
    {
        "title": f"chore: re-lock ensemble chain ({today})",
        "head": branch,
        "base": "main",
        "body": (
            f"Automated re-lock triggered by `relock-chain.yml`.\n\n"
            f"**New chain SHA256:** `{new_sha}`\n"
            f"**Previous SHA256:** `{old_sha}`\n\n"
            f"Updated HEAD SHAs for all {len(REPOS)} repos.\n"
        ),
    },
)
print(f"PR opened: {pr['html_url']}")
PYEOF

