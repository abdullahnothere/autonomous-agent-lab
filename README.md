# autonomous-agent-lab

A workspace for running Claude Code as an autonomous engineering team: a lead
agent plans and coordinates, and specialist subagents carry out focused work.

## Layout

| Path | Purpose |
| --- | --- |
| `CLAUDE.md` | Operating instructions every session follows |
| `docs/architecture.md` | System design, components, interfaces |
| `docs/decisions.md` | Architecture decision records (ADRs) |
| `docs/progress.md` | Running log of work done, in progress and blocked |
| `.claude/agents/` | Specialist subagent definitions |
| `.github/workflows/ci.yml` | CI: repo checks, then lint/typecheck/test once code exists |
| `scripts/validate-agents.sh` | Checks every agent file has valid frontmatter |

## Specialist agents

| Agent | Use for |
| --- | --- |
| `architect` | Design, interfaces, trade-offs, ADRs — no implementation |
| `frontend-engineer` | UI, client state, accessibility, component tests |
| `backend-engineer` | APIs, data models, validation, server tests |
| `security-reviewer` | Read-only review of auth, input handling, secrets, dependencies |
| `qa-engineer` | Test strategy, integration/e2e tests, verifying acceptance criteria |

## How to start a project

Give Claude Code a requirements brief with explicit acceptance criteria. It
will record a plan in `docs/progress.md`, design in `docs/architecture.md`,
delegate to the agents above, and finish with the completion report defined
in `CLAUDE.md`.

## CI

CI always validates the repo structure and agent definitions. Once a
`package.json` exists, it also runs `npm ci`, then the `lint`, `typecheck`
and `test` scripts — each one only if it is defined.
