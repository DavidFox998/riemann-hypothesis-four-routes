# Provenance Index

- `sources.csv` pins each source package to its repository revision.
- `declarations.csv` indexes every detected Lean declaration by source package,
  repository, revision, path, line, kind, and name.

Regenerate both files with `python scripts/import_sources.py`. A mathematical
reference can be added to active `RH.Provenance` records during migration.