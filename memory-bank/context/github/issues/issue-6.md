---
issue_number: 6
title: "missing .codemachine\artifacts\plan\*.md"
state: CLOSED
author: Robsars
created_at: 2025-10-14T20:02:52Z
updated_at: 2025-10-14T20:18:34Z
closed_at: 2025-10-14T20:16:55Z
labels: []
comments_count: 1
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/6
backup_date: 2026-01-04T07:37:20Z
---

# #6: missing .codemachine\artifacts\plan\*.md

**State:** CLOSED
**Author:** @Robsars
**Created:** 2025-10-14T20:02:52Z
**Updated:** 2025-10-14T20:18:34Z
**Closed:** 2025-10-14T20:16:55Z
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/6

---

## Description

I am getting an error maybe you can help with. I have created an extensive specifications.md and placed it in the .codemachine\inputs dir, as instructed. I have run it several times including editing template.json to disable resume from last step. I am using codex.

Fallback agent completed successfully. ══════════════════════════════════════ Task Breakdown Agent failed: ❌ Error: {plan} is required to complete this stage and provide high-quality results.

Expected file: .codemachine\artifacts\plan\*.md

There is no such 'plan' directory. However, there are several files in the artifacts directory, including a plan.md.

This looks very promising. I can't wait to see it complete.

Thanks

---

## Comments (1)


### Comment by @moazbuilds

**Date:** 2025-10-14T20:16:55Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/6#issuecomment-3403468940

This has been solved and released to npm v0.3.1

to update use 

`npm install -g codemachine@latest`

---
