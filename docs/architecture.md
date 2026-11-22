# Architecture

> Owned by the `architect` agent. Update whenever components, interfaces or
> data flows change.

## Overview

_No product has been specified yet. This repository currently contains only
the agent operating framework (instructions, specialist agents, CI)._

## Components

| Component | Responsibility | Owner agent |
| --- | --- | --- |
| _tbd_ | | |

## Interfaces

Document every contract that parallel work depends on (API routes, shared
types, events) **before** delegating implementation.

## Data model

_tbd_

## Security model

Authentication, authorisation, trust boundaries and secret handling. Secrets
come from environment variables or a secret manager — never from source.

## Testing strategy

- Unit tests next to the code they cover.
- Integration tests for each API boundary.
- End-to-end tests for critical user journeys.
