---
issue_number: 37
title: "Engine option in resolveModule() is ignored - always falls back to Codex"
state: CLOSED
author: ReWrite94
created_at: 2025-11-28T08:03:44Z
updated_at: 2025-11-30T01:00:23Z
closed_at: 2025-11-30T01:00:23Z
labels: [bug]
comments_count: 0
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/37
backup_date: 2026-01-04T07:37:18Z
---

# #37: Engine option in resolveModule() is ignored - always falls back to Codex

**State:** CLOSED
**Author:** @ReWrite94
**Created:** 2025-11-28T08:03:44Z
**Updated:** 2025-11-30T01:00:23Z
**Closed:** 2025-11-30T01:00:23Z
**Labels:** bug
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/37

---

## Description

When using `resolveModule()` in a workflow with `engine: 'claude'` specified, the engine option is ignored and CodeMachine attempts to use Codex instead, even when:

1. Codex CLI is not installed
2. The workflow explicitly sets `engine: 'claude'`
3. The module config in `config/modules.js` has `engine: 'claude'`

## Steps to Reproduce

1. Configure a workflow with a module using Claude engine:

```javascript
// codemachine.workflow.js
export default {
  name: 'My Workflow',
  steps: [
    resolveStep('some-agent', { engine: 'claude' }),  // Works fine
    resolveModule('check-task', { engine: 'claude', loopSteps: 6 }),  // Fails
  ],
};
```

2. Optionally add `engine: 'claude'` to the module config:

```javascript
// config/modules.js
{
  id: 'check-task',
  name: 'Task Completion Checker',
  promptPath: '...',
  engine: 'claude',  // Also ignored
  behavior: { type: 'loop', action: 'stepBack' },
}
```

3. Run the workflow with `/start`

## Expected Behavior

The `check-task` module should execute using Claude as specified.

## Actual Behavior

```
error: Codex authentication required
    at d$ (/$bunfs/root/runner-process.js:114:9)
    at async N5 (/$bunfs/root/runner-process.js:114:706)
    at async b4 (/$bunfs/root/runner-process.js:299:2259)
    at async mz (/$bunfs/root/runner-process.js:624:6766)
    at async iz (/$bunfs/root/runner-process.js:645:1044)
```

## Analysis

Looking at the minified source, the engine resolution logic appears to be:

```javascript
if(R)s=R;else if(DA.engine)s=DA.engine;else{...fallback}
```

For `resolveStep()`, the engine parameter (`R`) is properly passed through. However, for `resolveModule()`, neither the workflow option nor the module config's `engine` property appears to be read, causing it to fall through to the fallback which defaults to Codex.

## Environment

- **CodeMachine version:** 0.7.0
- **OS:** macOS
- **Claude CLI:** Installed and authenticated
- **Codex CLI:** Not installed

---

## Comments (0)

