---
issue_number: 49
title: "[Bug] Workflow fails with \\"ConnectError: [invalid_argument]\\" & \\"Plan Mode\\" error on macOS"
state: OPEN
author: m0ch
created_at: 2025-12-05T09:58:23Z
updated_at: 2025-12-05T09:58:23Z
closed_at: N/A
labels: []
comments_count: 0
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/49
backup_date: 2026-01-04T07:37:17Z
---

# #49: [Bug] Workflow fails with "ConnectError: [invalid_argument]" & "Plan Mode" error on macOS

**State:** OPEN
**Author:** @m0ch
**Created:** 2025-12-05T09:58:23Z
**Updated:** 2025-12-05T09:58:23Z
**Closed:** N/A
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/49

---

## Description

**Description**
I am trying to run the CodeMachine CLI (v0.7.0) with Cursor. I have successfully installed the `cursor` CLI command and initialized the git repository. However, the workflow crashes immediately during the Agent initialization phase with a `ConnectError` and a message about "Plan mode".

**Environment**
*   **OS:** macOS (Apple Silicon)
*   **CodeMachine Version:** v0.7.0
*   **Cursor Version:** Latest (CLI version 2.1.48)
*   **Subscription:** Cursor Pro (Logged in)

**Logs / Error Message**
The CLI exits with code `1`. The logs show the following error chain:
```text
Workflow execution failed: 176 ...
Error: Cursor CLI exited with code 1
ConnectError: [invalid_argument]
Cursor Error: This is commonly related to plan mode. You may need to check if you're in plan mode to use pro models.
```
*Note: The error persists regardless of whether the model is set to `auto` or hardcoded to `claude-3.5-sonnet` in `agents-config.json`.*

**Steps to Reproduce**
1.  Initialize a new project (`git init`).
2.  Ensure `cursor` is in PATH (`which cursor` returns valid path).
3.  Run CodeMachine via `/start`.
4.  The process fails at `Agent (init)` or shortly after starting the pipeline.

**Troubleshooting Attempted**
*   Verified `cursor` command is installed and accessible via terminal.
*   Verified the folder is a git repository.
*   Verified I am logged into Cursor with a Pro account.
*   Tried explicitly setting `"model": "claude-3.5-sonnet"` in `.codemachine/agents/agents-config.json` to bypass the `auto` -> `gpt-5` mapping issue.
*   Tried running with the project folder explicitly opened in Cursor.

**Suspected Issue**
It seems like CodeMachine is passing arguments to the `cursor` CLI that are rejected by the current version of the Cursor gRPC server (`invalid_argument`), possibly related to how the "Composer" or "Agent" mode is invoked programmatically.

**Full Log**

[ERROR] Agent 1 (init) failed after 2044ms: Cursor CLI exited with code 1
Workflow execution failed: 176 | ').length}'),WB(Cursor runner - args count: ${h.length}, model: ${g??"auto"}*);let y;try{y=await ND({command:,args:h, cwd: C , env: v, stdinInput:I,onStdout:W?void 0: (DA) →{let s=0(DA). trim().split(*
'); for(let c of s){if(!c.trim())continue;let i=Mk(c);if(i)R?.(i+
178 | 33, onStderr:W?void 0:(DA)→{let QA=0(DA);if(QA. includes("ConnectError: [invalid_argument]") ||QA. includes("'Error ="))M?. (°\u26A0\uFEOF Cursor Error:
This is commonly related to plan mode. You may need to check if you're in plan mode to use pro models.
');M?. (QA)},signal:N,stdioMode:W?"inherit": "pipe"
, timeout:L})}catch(DA) {let QA=DA, S=QA?. message??""; if(QA?. code= "ENOENT" || /not recognized as an inter
command/i. test(s) ||/command not found/i.test(s)){let i=${x} ${h.join(" ")}'.trim(),l=yE.installCommand,d=yE. name; throw console. error ( [ERROR
CLI not found when executing: ${i}'),Error(''${x}' is not available on this system. Please install ${d} first:
${1}*)}throw DA}if(y.exitCode #0){let QA=(y.stderr.trim() ||y.stdout.trim() ||"no error output").split(*
181 | '), command: ${x} ${h.join(" ")} '}), Error(Cursor CLI exited with code ${y.exitCode}*)}return{stdout:y.stdout, stderr:y.stderr}}var Rk, E6,_4="";var D6=n(
() →{A2() ; I6() ;k4() ;Q0() ;YD() ;XE() ;Rk=new RegExp(String.raw'\^[\[[0-9;?]*[
-/]*[@~]',"g"),E6=new Map});var u5=n(async()→{D6();B2();await C2()});var F6=n
(async () →{I6();u5();D6()}) ;var vF,bx;var x5=n(()→{vF={AUTO: "auto", CHEETAH: "cheetah", SONNET_4_5: "sonnet-4.5", SONNET_4_5_THINKING: "sonnet-4.5-thinking", GPT_5
: "gpt-5", GPT_5_CODEX: "gpt-5-codex", OPUS_4_1:"opus-4.1", GROK:"grok"}, bx={"gpt-5-codex" :vF .GPT_5_CODEX, "gpt-4" :vF.GPT_5, "gpt-4-turbo":vF.GPT_5, "gpt-3.5-turbo" :
VF. CHEETAH, "01-preview" :vF.OPUS_4_1, "01-mini":vF.SONNET_4_5, sonnet:vF.SONNET_4_5, "claude-sonnet-4.5" :vF.SONNET_4_5, opus:v.OPUS_4_1}}) ;var b5; var h5=n(async ( ) →{k4();Q6() ;await F6();Q6();x5();F6();b5={metadata:yE, auth:B6, run: C633);var NC;var T4=n(()→{NC={id:"ccr", name: "Claude Code Router", description:"Authentica
te with Claude Code Router", cliCommand: "cor", cliBinary: "ccr", installCommand:"npm install | ...

error: Cursor CLI exited with code 1
at c6 (/$bunfs/root/runner-process.js:181:41)
at async run (/$bunfs/root/runner-process.js: 272:2227) at async N5 (/$bunfs/root/runner-process.js:114:1228)
at async b4 (/$bunfs/root/runner-process. is: 299:2259)
at async mz (/$bunfs/root/runner-process. js: 624:6766)
at async iz (/$bunfs/root/runner-process.js:645:1044)

---

## Comments (0)

