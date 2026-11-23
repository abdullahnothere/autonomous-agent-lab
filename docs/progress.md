# Progress

Maintained by the lead agent. Newest entries at the top.

## Status
- **Current goal:** Framework set up; waiting for a product brief.
- **Blockers:** None.

## Log

### 2026-11-23 — Fixes from agent test run
- Architect: proposes scope beyond the brief as an open question instead of
  assuming it.
- Security reviewer: findings use repo-relative `path:line`.
- QA: `test` script must point at test files; bare `node --test src/` runs
  nothing.
- Added root `package.json` (no dependencies) and `package-lock.json`, with
  `test` = `node --test` (default file discovery) and `lint:agents`. CI's
  `npm ci` step can now succeed (ADR-004).
- Added `.claude/settings.json` allowing common read-only commands so agents
  stop on fewer permission prompts (ADR-005).
- No change for agents misreporting their own setup: judge them by
  behaviour. Agent definitions load at session start, so start a new session
  to pick these up.

### 2026-11-22 — Replace CI workflow
- Replaced `.github/workflows/ci.yml` with the owner-supplied "Project CI"
  workflow (ADR-003).

### 2026-11-22 — Repository scaffolding
- Added `CLAUDE.md` operating instructions.
- Added docs: architecture, decisions (ADR-001, ADR-002), progress.
- Added five specialist agents in `.claude/agents/`.
- Added CI (`.github/workflows/ci.yml`) and `scripts/validate-agents.sh`.

## Next
- Receive a product brief with acceptance criteria.
- Architect drafts `docs/architecture.md` and interface contracts.
