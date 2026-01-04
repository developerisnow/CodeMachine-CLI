---
issue_number: 39
title: "resolveModule() ignores engine parameter, defaults to Codex"
state: CLOSED
author: buckstrdr
created_at: 2025-11-28T12:20:43Z
updated_at: 2025-11-30T01:00:24Z
closed_at: 2025-11-30T01:00:24Z
labels: [bug, duplicate]
comments_count: 1
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/39
backup_date: 2026-01-04T07:37:17Z
---

# #39: resolveModule() ignores engine parameter, defaults to Codex

**State:** CLOSED
**Author:** @buckstrdr
**Created:** 2025-11-28T12:20:43Z
**Updated:** 2025-11-30T01:00:24Z
**Closed:** 2025-11-30T01:00:24Z
**Labels:** bug, duplicate
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/39

---

## Description

  When using resolveModule() in a workflow file, the engine parameter is ignored. The module always executes using Codex regardless of the specified engine.

  Steps to Reproduce:

  1. Create a workflow with resolveModule() specifying engine: 'claude':
  resolveModule('check-task', {
    engine: 'claude',
    model: 'sonnet',
    loopSteps: 6,
    loopMaxIterations: 30,
    loopSkip: ['runtime-prep']
  }),

  2. Run the workflow with codemachine
  3. Observe the check-task module execution

  Expected Behavior:
  Module should execute using Claude Code with the sonnet model.

  Actual Behavior:
  Module executes using Codex, causing error:
  [CYAN]● Codex is analyzing your request...
  Task Completion Checker failed: Codex CLI exited with code 1
  {"type":"error","message":"unexpected status 400 Bad Request: {\"detail\":\"The 'sonnet' model is not supported when using Codex with a ChatGPT account.\"}"}

  Note: resolveStep() correctly respects the engine parameter - only resolveModule() has this issue.

  Environment:
  - CodeMachine version: (run codemachine --version)
  - OS: Linux (Ubuntu)
  - Node: v22.20.0

  Workaround:
  Use Codex-compatible settings for modules:
  resolveModule('check-task', {
    engine: 'codex',
    model: 'gpt-5',
    // ...
  }),

---

## Comments (1)


### Comment by @moazbuilds

**Date:** 2025-11-28T12:27:14Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/39#issuecomment-3589149846

Duplicate of #37
Duplicate of #38

---
