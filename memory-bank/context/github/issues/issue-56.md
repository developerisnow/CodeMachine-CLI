---
issue_number: 56
title: "Infinite Loop at Task Completion Checker"
state: OPEN
author: sollozzo13
created_at: 2025-12-10T15:37:06Z
updated_at: 2025-12-12T20:57:51Z
closed_at: N/A
labels: [needs investigation]
comments_count: 3
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/56
backup_date: 2026-01-04T07:37:16Z
---

# #56: Infinite Loop at Task Completion Checker

**State:** OPEN
**Author:** @sollozzo13
**Created:** 2025-12-10T15:37:06Z
**Updated:** 2025-12-12T20:57:51Z
**Closed:** N/A
**Labels:** needs investigation
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/56

---

## Description

The execution proceeds normally until Task Completion Checker, where the process enters an infinite loop and never completes plus all processes are too slow. 

 ╭─ Agent 21: check-task ─────────────────────────────────────────
    Started: 2025-12-10 15:35:36
    Prompt: **// PROTOCOL: TaskCompletionChecker_v1.0**
 ╰───────────────────────────────────────────────────────────────
 ● OpenCode is analyzing your request...
.
.
.

 ● Command: list
 ⎿ .codemachine/memory
 ● Command: write
 ⎿ .codemachine/memory/behavior.json
 ● Command: write
 ⎿ .codemachine/memory/behavior.json
 ● Command: write
 ⎿ .codemachine/memory/behavior.json
 ● Command: write
 ⎿ .codemachine/memory/behavior.json
 ● Command: write
 ⎿ .codemachine/memory/behavior.json
 ● Command: read
 ⎿ .codemachine/memory/behavior.json
 ● Command: write
 ⎿ .codemachine/memory/behavior.json
 ● Command: write
 ⎿ .codemachine/memory/behavior.json
 ● Command: write
 ⎿ .codemachine/memory/behavior.json

 Lines 342-376 of 376 (100%) • Live updates enabled
 [Esc] Close  [↑↓] Scroll  [PgUp/PgDn] Page

---

## Comments (3)


### Comment by @moazbuilds

**Date:** 2025-12-11T14:58:25Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/56#issuecomment-3642331246

Try change the default model as mentioned in #57  to a different one and let me know how it goes.

---

### Comment by @sollozzo13

**Date:** 2025-12-11T21:11:29Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/56#issuecomment-3643797228

Yes I changed the default engine and model. Stuck at Task Completion Checker again and "bun" running out of memory space.  Windows 11. I installed Opencode and Codemachine using npm

---

### Comment by @sollozzo13

**Date:** 2025-12-12T20:57:51Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/56#issuecomment-3648121287

EDIT When you get an error, please **try different models** and write a more detailed plan

---
