<<<<<<< HEAD
# healthcare-sql-joins-demo
=======
# Healthcare SQL Joins Demo

A mini relational database modeling common healthcare entities (patients, providers, insurance, visits, labs, billing, inventory) with foreign keys and a set of join queries that demonstrate practical analytics.

## What this shows
- Relational modeling with FKs and sensible naming
- Inner/left joins across multiple tables
- Basic analytics (counts, distincts, ordering)
- CI that builds and tests the DB on every push (SQLite)

## Quickstart (SQLite)
```bash
sqlite3 demo.db < sql/01_schema.sql
sqlite3 demo.db < sql/02_seed.sql
sqlite3 demo.db < sql/03_queries.sql

ER Diagram
Lucidchart Export

Hand-Drawn Sketch

Text (Mermaid)

See docs/erd.mmd

Notes

All data is synthetic. No real PHI/PII. Payment info is fake and for demo only.

See Issues for planned “v2” cleanup (column names, typos, constraints).

License

MIT
>>>>>>> f97365e (feat: schema, seed, queries, ERDs, and CI)
