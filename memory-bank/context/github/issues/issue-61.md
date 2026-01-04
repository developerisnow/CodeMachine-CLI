---
issue_number: 61
title: "Founder Architect agent critical EPERM error"
state: OPEN
author: hnipps
created_at: 2025-12-15T14:42:42Z
updated_at: 2025-12-15T14:42:42Z
closed_at: N/A
labels: []
comments_count: 0
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/61
backup_date: 2026-01-04T07:37:16Z
---

# #61: Founder Architect agent critical EPERM error

**State:** OPEN
**Author:** @hnipps
**Created:** 2025-12-15T14:42:42Z
**Updated:** 2025-12-15T14:42:42Z
**Closed:** N/A
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/61

---

## Description

The Founder Architect agent in the default workflow is not able to read `/Users/<username>/.codemachine/claude/.claude.json` for some reason. This prevents the agent from creating the architecture doc and therefore the workflow cannot continue.

I have successfully run the workflow once before, without encountering this, and I haven't updated the CLI since.

I'm using Claude Code as the sole engine and have confirmed that Claude Code can read the file when run directly via the `claude` CLI.

<details>
<summary>Founder Architect agent logs</summary>

[CYAN]===╭─ Agent 12: founder-architect ──────────────────────────────────
[CYAN]   Started: 2025-12-15 14:34:28
[CYAN]   Prompt: **// PROTOCOL: FoundationArchitect_v1.0**
[CYAN]╰───────────────────────────────────────────────────────────────

[STDERR] This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). The promise rejected with the reason:
[STDERR] Error: EPERM: operation not permitted, open '/Users/USERNAME/.codemachine/claude/.claude.json'
    at Module.openSync (node:fs:560:18)
    at file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:9:942
    at XX (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:8:8084)
    at Object.writeFileSync (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:9:717)
    at eP (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:4357:1175)
    at hNQ (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:305:8333)
    at n0 (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:305:7143)
    at file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:328:47971
    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)
This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). The promise rejected with the reason:
Error: EPERM: operation not permitted, open '/Users/USERNAME/.codemachine/claude/.claude.json'
    at Module.openSync (node:fs:560:18)
    at file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:9:942
    at XX (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:8:8084)
    at Object.writeFileSync (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:9:717)
    at eP (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:4357:1175)
    at hNQ (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:305:8333)
    at n0 (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:305:7143)
    at file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:328:47971
    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)
[STDERR] Error: EPERM: operation not permitted, open '/Users/USERNAME/.codemachine/claude/debug/c7af2f80-211d-430e-bf85-21e837b7150f.txt'
    at Module.openSync (node:fs:560:18)
    at file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:9:1153
    at XX (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:8:8084)
    at Object.appendFileSync (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:9:1082)
    at writeFn (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:9:27475)
    at Timeout.J [as _onTimeout] (file:///Users/USERNAME/.nvm/versions/node/v24.9.0/lib/node_modules/@anthropic-ai/claude-code/cli.js:9:26848)
    at listOnTimeout (node:internal/timers:608:17)
    at process.processTimers (node:internal/timers:543:7) {
  errno: -1,
  code: 'EPERM',
  syscall: 'open',
  path: '/Users/USERNAME/.codemachine/claude/debug/c7af2f80-211d-430e-bf85-21e837b7150f.txt'
}
[STDERR] 
[ERROR] Claude CLI exited with code 1
</details>

---

## Comments (0)

