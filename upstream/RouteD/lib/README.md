# lib/ — Generated TypeScript API Clients (incidental scaffold)

Generated API-client artifacts from an orval run against a "health"-style REST API — ZeroBeacon/product backend scaffolding. **Nothing here is referenced by the Lean build, the lakefile, or any math file.** No source files or `package.json` are in-tree; only `dist/` output was committed.

| Subfolder | Contents |
|---|---|
| `api-client-react/` | orval-generated TanStack React Query client (`setBaseUrl`, `setAuthTokenGetter`, `generated/api`, `api.schemas`) |
| `api-zod/` | orval v8.5.3-generated Zod schemas (only type present: `healthStatus`) |
| `db/` | Drizzle ORM node-postgres pool (`pool`, `db`, empty `schema/`) |

Safe to ignore — or to delete — when auditing the mathematics. The Lean entry points are [Family/](../Family/README.md), [SelfSymmetry/](../SelfSymmetry/README.md), [Route/](../Route/README.md), and [Towers/](../Towers/README.md).
