---
issue_number: 4
title: "architecture breaks then all of it is gone"
state: CLOSED
author: cranyy
created_at: 2025-10-11T02:51:50Z
updated_at: 2025-10-12T17:18:18Z
closed_at: 2025-10-12T17:18:18Z
labels: []
comments_count: 2
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/4
backup_date: 2026-01-04T07:37:20Z
---

# #4: architecture breaks then all of it is gone

**State:** CLOSED
**Author:** @cranyy
**Created:** 2025-10-11T02:51:50Z
**Updated:** 2025-10-12T17:18:18Z
**Closed:** 2025-10-12T17:18:18Z
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/4

---

## Description

ave you written the full specification in .codemachine/inputs/specifications.md?
Add any necessary context files, then run /start to begin.
════════════════════════════════════════════════════════════
CODEMACHINE> /start
Launching workflow queue (spec=/mnt/e/garbage/.codemachine/inputs/specifications.md, force=false)
Using workflow template: CodeMachine Workflow
Git Commit Agent skipped (already completed).
Architecture Agent skipped (already completed).
════════════════════════════════════════════════════════════════════════════════
Plan Agent started to work.
No engine specified, using Codex (codex)
Plan Agent failed: Failed to process placeholder {architecture}: Failed to load placeholder content from /mnt/e/garbage/.codemachine/plan/architecture.md: ENOENT: no such file or directory, open '/mnt/e/garbage/.codemachine/plan/architecture.md'
Failed to process placeholder {architecture}: Failed to load placeholder content from /mnt/e/garbage/.codemachine/plan/architecture.md: ENOENT: no such file or directory, open '/mnt/e/garbage/.codemachine/plan/architecture.md'
CODEMACHINE>

---

## Comments (2)


### Comment by @moazbuilds

**Date:** 2025-10-11T11:05:57Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/4#issuecomment-3393209236

Has your arch-agent completed its task and generated the arch file?

Your logs shows:
Architecture Agent skipped (already completed).
While you don't have plan/architecture.md 
 

---

### Comment by @moazbuilds

**Date:** 2025-10-11T11:25:02Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/4#issuecomment-3393220416


---

The **plan agent** needs to review your architecture in order to generate a high-quality plan. That’s why I intentionally kept the error visible for the user.

If you get stuck at this stage and want to go back, you can edit the file **`.codemachine/template.json`** and remove the last completed step entry:

```json
"completedSteps": [
  0,
  1,
  2  ← remove this
]
```

This is just a simple indexing mechanism — it prevents the planning agents from running multiple times unnecessarily.
If you prefer, you can remove this indexing completely from the template.

To make the agent re-run every time without issues, update this line:

```js
resolveStep('arch-agent', { executeOnce: true, engine: 'claude' }),
```

Remove the `executeOnce` property like this:

```js
resolveStep('arch-agent', { engine: 'claude' }),
```

This will allow the agents to execute immediately on each run.
I’ll provide detailed documentation for this soon.

---
