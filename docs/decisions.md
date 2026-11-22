# Decision Log

Significant technical decisions, newest last. Copy the template for each new
entry. Do not edit accepted decisions — supersede them with a new entry.

## Template

```
## ADR-NNN: Title
- Date: YYYY-MM-DD
- Status: Proposed | Accepted | Superseded by ADR-NNN
- Context: what forced the decision
- Decision: what we chose
- Alternatives: what we rejected and why
- Consequences: trade-offs we accept
```

---

## ADR-001: Lead agent plus specialist subagents
- Date: 2026-11-22
- Status: Accepted
- Context: Work should be planned, parallelised and reviewed rather than
  generated in one pass.
- Decision: One lead session plans and integrates; five specialist subagents
  (architect, frontend, backend, security, QA) in `.claude/agents/` do
  focused work. Interfaces are fixed in `docs/architecture.md` before
  parallel implementation.
- Alternatives: A single generalist agent (simpler, but no separation between
  implementation and review).
- Consequences: Coordination overhead; the security reviewer is read-only so
  review stays independent of implementation.

## ADR-002: CI that adapts to repository contents
- Date: 2026-11-22
- Status: Superseded by ADR-003
- Context: No application code exists yet, but CI should be in place from the
  first commit and should not need rewriting when code arrives.
- Decision: CI always validates structure and agent definitions; it runs
  `npm ci`, `lint`, `typecheck` and `test` only when `package.json` exists
  and only for the scripts that are defined.
- Alternatives: Add CI later (risks code landing untested); hard-require npm
  scripts now (CI would fail on an empty repo).
- Consequences: Once a project exists, a missing `lint`/`typecheck`/`test`
  script is skipped silently — the QA agent must make sure all three are defined.

## ADR-003: Single Node CI job on main
- Date: 2026-11-22
- Status: Accepted
- Context: The project owner supplied a standard Node CI workflow.
- Decision: `.github/workflows/ci.yml` runs one job on pushes and pull
  requests to `main`: `npm ci`, then `typecheck`, `lint`, `test` and `build`
  (each only if the script is defined).
- Alternatives: Keep the adaptive repo-checks workflow from ADR-002.
- Consequences: CI requires `package.json` and `package-lock.json`; until they
  exist it fails at setup/install. Agent-definition and `.env` checks no
  longer run in CI (`scripts/validate-agents.sh` can still be run locally).
  Feature-branch pushes only get CI through a pull request to `main`.
