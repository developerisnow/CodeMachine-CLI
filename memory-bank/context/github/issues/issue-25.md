---
issue_number: 25
title: "codemachine crashes on SSH disconnect on Ubuntu VPS"
state: CLOSED
author: developerisnow
created_at: 2025-11-12T06:02:26Z
updated_at: 2025-11-12T07:22:51Z
closed_at: 2025-11-12T07:21:36Z
labels: []
comments_count: 4
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/25
backup_date: 2026-01-04T07:37:18Z
---

# #25: codemachine crashes on SSH disconnect on Ubuntu VPS

**State:** CLOSED
**Author:** @developerisnow
**Created:** 2025-11-12T06:02:26Z
**Updated:** 2025-11-12T07:22:51Z
**Closed:** 2025-11-12T07:21:36Z
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/25

---

## Description

# codemachine crashes on SSH disconnect on Ubuntu VPS

## Environment
- **OS:** Ubuntu 20.04/22.04 LTS (VPS)
- **codemachine version:** 0.5.0
- **Node:** v22.21.1
- **Connection:** SSH via tmux (nested: local tmux → SSH → server tmux)

## Problem Description

codemachine stops running when SSH connection is lost (closing laptop, network disconnect, etc.), even when running inside tmux session.

**Expected behavior:** Process should continue running in background after SSH disconnect (tmux/screen standard behavior)

**Actual behavior:** codemachine process terminates when SSH session ends

## Steps to Reproduce

1. Connect to Ubuntu VPS via SSH
2. Start tmux session: `tmux new -s work`
3. Start codemachine: `codemachine start`
4. Detach from tmux: `Ctrl+B` then `D`
5. Close SSH connection (close laptop/terminal)
6. Reconnect to VPS
7. Reattach tmux: `tmux attach -t work`
8. **Result:** codemachine is no longer running

## Root Cause Analysis

After investigation with WebSearch and testing:

1. **systemd KillUserProcesses:** On Ubuntu, systemd may kill user processes on logout even inside tmux
2. **User lingering:** `loginctl enable-linger` was already enabled but insufficient
3. **Process attachment:** codemachine might not properly detach from controlling terminal

## Workaround

Created wrapper script using `nohup` to properly detach:

```bash
#!/usr/bin/env bash
nohup bash -c "
    cd /path/to/project
    exec codemachine start >> logs/output.log 2>> logs/error.log
" > /dev/null 2>&1 &
```

This survives SSH disconnect and keeps codemachine running.

## Proposed Solution

codemachine should handle SSH disconnects gracefully, similar to other long-running CLI tools:

**Option 1:** Auto-detach from terminal on startup
```javascript
// In codemachine startup
process.stdin.unref();
process.stdout.unref();
process.stderr.unref();
```

**Option 2:** Document recommended launch method
- Add section in README about running on VPS/remote servers
- Recommend using `nohup`, `systemd-run --user --scope`, or tmux with proper config

**Option 3:** Add `--daemon` flag
```bash
codemachine start --daemon  # Auto-detaches and runs in background
```

## Additional Context

**Related Issues:**
- Similar behavior reported with other Node.js CLI tools on Ubuntu VPS
- Works fine on macOS (different systemd behavior)

**Logs:**
No errors in codemachine logs - process simply terminates silently when SSH disconnects

**Workaround scripts available:**
- Persistent launcher: `codemachine-persistent.sh` (nohup-based)
- Status checker: `codemachine-status.sh`
- Graceful stop: `codemachine-stop.sh`

Can provide full scripts if helpful for documentation/testing.

## Impact

**Severity:** High for VPS users
- Cannot run long workflows unattended
- Must keep SSH connection open entire time
- Defeats purpose of running on remote server

**Workaround available:** Yes (nohup wrapper scripts)

---

**Would appreciate:**
1. Guidance on whether this is expected behavior
2. Best practice recommendation for VPS deployment
3. Consideration for built-in daemonization support

Thank you!

---

## Comments (4)


### Comment by @developerisnow

**Date:** 2025-11-12T07:03:40Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/25#issuecomment-3520357404

## ✅ Update: Issue Resolved - Process Survives, UI Detaches (Expected Behavior)

### Investigation Results

After extensive testing and source code analysis, I can confirm:

**✅ The nohup workaround works perfectly** - process survives SSH disconnect
**❌ The "crash" was misdiagnosed** - process continues working, only UI detaches

### What's Actually Happening

```
SSH Session 1 (laptop open):
  ├─ codemachine process ✅ (PPID=1 via nohup)
  └─ Ink UI (TTY attached) ✅

[Close laptop / SSH disconnect]

Background:
  └─ codemachine process ✅ (continues working)
      └─ Ink UI: lost TTY ❌ (but not crash!)

SSH Session 2 (reconnect):
  └─ New terminal (new TTY)
      └─ Cannot reconnect to existing Ink instance
```

### Evidence: Process Running 60+ Minutes After Disconnect

```bash
$ codemachine-status.sh
✅ Process: RUNNING (PID: 4015422)
   4015422       1    01:01:04 node /home/user/.local/bin/codemachine start

Recently Updated Files:
   Nov 12 06:59: agent-66-check-task-2025-11-12T06-59-10.log
   Nov 12 06:59: agent-65-git-commit-2025-11-12T06-58-20.log
   Nov 12 06:58: agent-64-task-sanity-check-2025-11-12T06-54-51.log
```

**Agents actively working:**
- Task Completion Checker triggering loops (iteration 4/20)
- Context Manager, Code Generation, Git Commit agents completing tasks
- Registry and logs continuously updated

### Root Cause: Ink Framework Limitation

**Source code:** `WorkflowUIManager.ts:36-42`
```typescript
start(): void {
  // Check TTY availability
  if (!process.stdout.isTTY) {
    this.fallbackMode = true;
    console.log(`Starting workflow: ${this.state.getState().workflowName}`);
    return;
  }
```

**Why UI detaches:**
1. Ink requires `process.stdout.isTTY` (terminal connection)
2. After SSH reconnect, new terminal ≠ old terminal
3. Process keeps reference to old (now invalid) TTY
4. No reconnection mechanism exists (searched codebase: no socket/IPC for UI)

**This is architectural limitation, not a bug to fix.**

---

## 🔧 Recommended Solution (VPS Deployment)

### Use nohup launcher + enhanced monitoring

**1. Persistent launcher** (`codemachine-persistent.sh`):
```bash
#!/usr/bin/env bash
set -e
CODEMACHINE_DIR="/path/to/project"
LOG_DIR="$CODEMACHINE_DIR/.codemachine/logs"
PID_FILE="$CODEMACHINE_DIR/.codemachine/codemachine.pid"

mkdir -p "$LOG_DIR"

# Check if already running
if [ -f "$PID_FILE" ]; then
    OLD_PID=$(cat "$PID_FILE")
    if ps -p "$OLD_PID" > /dev/null 2>&1; then
        echo "⚠️  Already running (PID: $OLD_PID)"
        exit 1
    fi
    rm "$PID_FILE"
fi

# Launch with nohup (survives SSH disconnect)
nohup bash -c "
    echo \$\$ > '$PID_FILE'
    cd '$CODEMACHINE_DIR'
    exec codemachine start >> '$LOG_DIR/persistent-output.log' 2>> '$LOG_DIR/persistent-error.log'
" > /dev/null 2>&1 &

sleep 2
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    echo "✅ Started (PID: $PID)"
fi
```

**2. Enhanced status monitor** (`codemachine-status.sh` v2.0):
```bash
#!/usr/bin/env bash
# Shows: running agents, recent logs, registry summary, errors

CODEMACHINE_DIR="/path/to/project"
PID_FILE="$CODEMACHINE_DIR/.codemachine/codemachine.pid"
LOG_DIR="$CODEMACHINE_DIR/.codemachine/logs"

# Check process
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if ps -p "$PID" > /dev/null 2>&1; then
        echo "✅ Process: RUNNING (PID: $PID)"
        ps -p "$PID" -o pid,ppid,etime,cmd --no-headers
    fi
fi

# Show agent status
if [ -f "$LOG_DIR/registry.json" ]; then
    echo "📊 Agent Status:"
    jq -r 'to_entries[] | select(.value.status == "running") | "   🔄 \(.value.id): \(.value.name)"' "$LOG_DIR/registry.json"
    jq -r 'to_entries | sort_by(.value.id) | .[-5:] | .[] | select(.value.status == "completed") | "   ✅ \(.value.id): \(.value.name)"' "$LOG_DIR/registry.json"
fi

# Last 10 lines of output
echo "📋 Last 10 Lines:"
tail -10 "$LOG_DIR/persistent-output.log"
```

**3. Graceful stop** (`codemachine-stop.sh`):
```bash
#!/usr/bin/env bash
PID_FILE="/path/to/project/.codemachine/codemachine.pid"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    kill -TERM "$PID" 2>/dev/null || true
    
    # Wait up to 10 seconds for graceful shutdown
    for i in {1..10}; do
        if ! ps -p "$PID" > /dev/null 2>&1; then
            echo "✅ Stopped gracefully"
            rm "$PID_FILE"
            exit 0
        fi
        sleep 1
    done
    
    # Force kill if needed
    kill -KILL "$PID" 2>/dev/null || true
    rm "$PID_FILE"
    echo "✅ Killed"
fi
```

---

## 📝 Documentation Recommendations

### For CodeMachine README/docs:

**Add section: "Running on Remote Servers (VPS/SSH)"**

```markdown
## Remote Server Deployment

When running codemachine on remote servers via SSH, the UI will detach after SSH disconnection (Ink framework limitation). The process continues working in background.

### Recommended Setup

1. Use nohup launcher for persistence
2. Monitor via log files instead of UI
3. Use enhanced status script for visibility

See: [VPS deployment guide](link-to-guide)

### Quick Start

\`\`\`bash
# Start (survives SSH disconnect)
nohup codemachine start >> logs/output.log 2>> logs/error.log &

# Monitor
tail -f logs/output.log

# Check status
ps aux | grep codemachine
\`\`\`
```

---

## 🎓 Lessons Learned

1. **Process daemonization works** - nohup successfully creates PPID=1 process
2. **UI ≠ Process** - Ink UI can detach while process continues
3. **Log monitoring crucial** - For headless operation, logs are primary interface
4. **Not a bug** - This is expected behavior for TTY-dependent CLI frameworks

---

## 📊 Summary

| Aspect | Status | Notes |
|--------|--------|-------|
| Process survival | ✅ Working | nohup solution effective |
| UI after reconnect | ❌ Detached | Expected (Ink limitation) |
| Agent execution | ✅ Working | Verified 60+ min uptime |
| Monitoring | ✅ Working | Enhanced status script |
| Documentation | ⚠️ Missing | VPS deployment guide needed |

---

**Recommendation:** Close as "working as expected" with documentation update. The nohup workaround is production-ready and solves the core issue (process survival). UI detachment is inherent to Ink's architecture and would require significant refactoring to address.

Happy to provide complete script files or additional details if helpful!

---

### Comment by @developerisnow

**Date:** 2025-11-12T07:17:23Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/25#issuecomment-3520395030

## 🔧 Solution Available

I've created PR #26 with deployment scripts and monitoring tools to address this issue.

**What's included:**
- Persistent launcher (SSH disconnect survival)
- Enhanced status monitoring
- Complete VPS deployment documentation

The PR provides pragmatic observability tools rather than UI architectural changes.

See: https://github.com/moazbuilds/CodeMachine-CLI/pull/26

---

### Comment by @developerisnow

**Date:** 2025-11-12T07:17:36Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/25#issuecomment-3520395541

## Summary (TL;DR)

**Status:** ✅ Solved with workaround scripts

**Root causes:**
1. SSH disconnect → process dies (systemd behavior on Ubuntu)
2. UI disappears on reconnect (Ink framework limitation)

**Solution in PR #26:**
- `nohup` launcher → process survives disconnect
- Status monitoring → verify actually working
- Documentation → understand expected behavior

**Process works headless** - UI detachment is not a bug, just an architectural limitation.

For immediate use, see deployment scripts in PR #26 or test branch `feat/vps-monitoring-scripts`.

---

### Comment by @developerisnow

**Date:** 2025-11-12T07:22:51Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/25#issuecomment-3520409140

FYI @moazbuilds , @SoyHub 

---
