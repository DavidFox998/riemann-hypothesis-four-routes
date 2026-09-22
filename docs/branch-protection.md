# Publication branch protection

The `main` branch is protected by GitHub branch protection.

## Required check

- Workflow: `Lean publication checks` (`.github/workflows/lean.yml`)
- Required emitted check: `build`
- Strict status checks: enabled; the branch must be current before merge
- GitHub Actions app binding: app ID `15368`

## Administrator policy

Administrators may bypass this protection. The repository owner explicitly selected this exception on September 21, 2026 when enabling the gate. All merges without administrator bypass must pass the required `build` check.

## Enforcement evidence

Test pull request [#1](https://github.com/DavidFox998/riemann-hypothesis-four-routes/pull/1) deliberately changes a preserved upstream snapshot without updating its recorded hash. GitHub Actions run [35684727394](https://github.com/DavidFox998/riemann-hypothesis-four-routes/actions/runs/35684727394) reports `build` as failed, and GitHub reports the pull request's merge state as `blocked`.

The live GitHub branch-protection configuration is authoritative; this document records the approved policy and the initial enforcement test.
