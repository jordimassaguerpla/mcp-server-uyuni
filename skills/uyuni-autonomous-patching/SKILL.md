---
name: uyuni-autonomous-patching

description: >
  Plan and safely schedule enterprise software patch waves using Uyuni
  through the MLM MCP Server. This skill analyzes pending errata,
  proposes a conservative rollout, prepares an operator plan and
  delegates authorization, approvals and auditing to the MCP Server.

version: 0.1.0

category: Infrastructure Operations

compatibility:
  - OpenClaw
  - Hermes
  - Goose
  - Codex CLI
  - Gemini CLI

requires:
  mcp_servers:
    - mlm

  tools:
    - list_system_groups
    - list_group_systems
    - get_unscheduled_errata
    - schedule_pending_updates_to_system

tags:
  - uyuni
  - patching
  - linux
  - infrastructure
  - devops
  - sre
---

# Autonomous Patch Planning for Uyuni

## Purpose

This skill captures operational knowledge for planning safe enterprise
patch waves using Uyuni.

The skill is responsible for:

- understanding the operator request;
- collecting the required operational data;
- proposing a conservative rollout strategy;
- explaining the reasoning behind the proposal;
- invoking the appropriate MCP tools.

The skill **does not implement governance**.

Authentication, authorization, approvals, auditing and policy enforcement
are delegated to the MLM MCP Server.

---

# Trigger Conditions

Use this skill whenever the operator wants to:

- analyze pending errata
- prepare a maintenance window
- patch server groups
- install pending updates
- build a rollout proposal
- update production systems
- create a canary rollout
- review security advisories

Typical requests:

> Patch the web servers.

> Prepare next Saturday maintenance.

> Analyze pending security errata.

---

# Required MCP Capabilities

The MLM MCP Server should expose:

- list_system_groups
- list_group_systems
- get_unscheduled_errata
- schedule_pending_updates_to_system

Do not attempt to replace MCP functionality with local reasoning.

---

# Operational Workflow

Always follow these phases.

---

## Phase 1 — Discovery

Identify:

- requested groups
- requested systems
- maintenance window
- change ticket
- available system groups

Validate that every requested group exists.

---

## Phase 2 — Environment Assessment

Collect:

- group membership
- pending errata
- security advisories
- bug fix advisories
- enhancement advisories

Do not generate recommendations before collecting complete information.

---

## Phase 3 — Risk Assessment

Evaluate:

- affected systems
- production impact
- security exposure
- maintenance scope

Prefer conservative rollouts over aggressive deployments.

---

## Phase 4 — Rollout Proposal

Generate a proposal containing:

- selected groups
- selected systems
- rollout rationale
- estimated impact
- identified risks

The proposal should minimise operational risk while preserving the
requested maintenance scope.

---

## Phase 5 — Deterministic Validation

Before invoking any write-capable MCP tool, verify:

- every selected group was explicitly requested;
- every selected group exists;
- every selected system belongs to one of the selected groups;
- duplicate systems have been removed;
- the proposal contains at least one system;
- the model has not invented groups, systems or advisories.

Never rely exclusively on model reasoning for policy validation.

---

## Phase 6 — Execution

Invoke the appropriate MCP tool.

Never reproduce MCP functionality locally.

If the MCP Server initiates an elicitation workflow:

- answer the requested questions;
- wait for completion;
- continue only after the server authorizes the operation.

Never bypass MCP governance.

---

## Phase 7 — Scheduling Verification

Verify:

- the scheduling request was accepted;
- action URLs or identifiers were returned;
- the expected systems were targeted;
- scheduling failures are reported.

Do **not** claim that patching has completed.

Scheduling and patch execution are different operations.

Execution status must be verified separately.

---

## Phase 8 — Reporting

Produce a concise operator report including:

- Executive Summary
- Selected Systems
- Risk Assessment
- Rollout Rationale
- Scheduled Actions
- Recommended Follow-up

---

## Governance

Governance is delegated to the MCP Server.

Do not implement authentication, authorization, approval workflows or auditing inside the skill.

---

# Safety Guidelines

## DO

- collect complete operational information;
- explain recommendations;
- prefer conservative rollouts;
- validate model output before execution;
- use MCP write tools whenever available.

## DO NOT

- invent systems;
- invent advisories;
- bypass governance;
- assume authorization;
- execute local shell commands when an MCP tool exists;
- retry destructive operations automatically.

---

# Failure Handling

Immediately stop when:

- a requested group does not exist;
- authorization fails;
- a required MCP capability is unavailable;
- policy validation fails;
- elicitation is rejected.

Explain clearly why execution stopped.

---

