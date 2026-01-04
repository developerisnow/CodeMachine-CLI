---
issue_number: 1
title: "Check if the AI engine exists before running the command."
state: CLOSED
author: bahyali
created_at: 2025-10-09T11:13:41Z
updated_at: 2025-10-09T19:05:25Z
closed_at: 2025-10-09T18:59:26Z
labels: []
comments_count: 1
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/1
backup_date: 2026-01-04T07:37:20Z
---

# #1: Check if the AI engine exists before running the command.

**State:** CLOSED
**Author:** @bahyali
**Created:** 2025-10-09T11:13:41Z
**Updated:** 2025-10-09T19:05:25Z
**Closed:** 2025-10-09T18:59:26Z
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/1

---

## Description

### Problem:
I received the following error because I don't have codex installed. 

### Suggestion:
Check if the AI engine exists before running it and if it doesn't tell the user how to install it.


```
Error: Command failed with ENOENT: codex login
spawn codex ENOENT
    at ChildProcess._handle.onexit (node:internal/child_process:286:19)
    at onErrorNT (node:internal/child_process:484:16)
    at process.processTicksAndRejections (node:internal/process/task_queues:90:21) {
  errno: -2,
  code: 'ENOENT',
  syscall: 'spawn codex',
  path: 'codex',
  spawnargs: [ 'login' ],
  originalMessage: 'spawn codex ENOENT',
  shortMessage: 'Command failed with ENOENT: codex login\nspawn codex ENOENT',
  command: 'codex login',
  escapedCommand: 'codex login',
  exitCode: undefined,
  signal: undefined,
  signalDescription: undefined,
  stdout: undefined,
  stderr: undefined,
  cwd: '/Users/bahy/playground/sustaina',
  failed: true,
  timedOut: false,
  isCanceled: false,
  killed: false
}
```

---

## Comments (1)


### Comment by @moazbuilds

**Date:** 2025-10-09T18:59:26Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/1#issuecomment-3387146924

This issue has been resolved in version v0.2.2.
The application now starts without requiring any AI engine to be installed on your backend.

When you log in, it will automatically display the installation method. If you’re logged into only one engine, it will intelligently fall back to that engine when others are not installed or authenticated. It detects active engine logins and provides smart fallback behavior in most scenarios.

Update:


npm install -g codemachine@latest
codemachine --version

---
