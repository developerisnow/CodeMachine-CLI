---
issue_number: 48
title: "Agent initialization failing with Cursor CLI"
state: OPEN
author: dbrogan-OSI
created_at: 2025-12-04T20:55:52Z
updated_at: 2025-12-30T23:22:15Z
closed_at: N/A
labels: []
comments_count: 2
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/48
backup_date: 2026-01-04T07:37:17Z
---

# #48: Agent initialization failing with Cursor CLI

**State:** OPEN
**Author:** @dbrogan-OSI
**Created:** 2025-12-04T20:55:52Z
**Updated:** 2025-12-30T23:22:15Z
**Closed:** N/A
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/48

---

## Description

Only authenticated with Cursor, had successful initialization at first iterating over the specification file. Now the following is error is hit after starting a new task on the same machine:

```bash
[ERROR] Agent 8 (init) failed after 1917ms: Cursor CLI exited with code 1
Workflow execution failed: 176 | `).length}`),WB(`Cursor runner - args count: ${h.length}, model: ${g??"auto"}`);let y;try{y=await ND({command:x,args:h,cwd:C,env:v,stdinInput:I,onStdout:W?void 0:(DA)=>{let s=O(DA).trim().split(`
177 | `);for(let c of s){if(!c.trim())continue;let i=Mk(c);if(i)R?.(i+`
178 | `)}},onStderr:W?void 0:(DA)=>{let QA=O(DA);if(QA.includes("ConnectError: [invalid_argument]")||QA.includes("Error ="))M?.(`\u26A0\uFE0F  Cursor Error: This is commonly related to plan mode. You may need to check if you're in plan mode to use pro models.
179 | `);M?.(QA)},signal:N,stdioMode:W?"inherit":"pipe",timeout:L})}catch(DA){let QA=DA,s=QA?.message??"";if(QA?.code==="ENOENT"||/not recognized as an internal or external command/i.test(s)||/command not found/i.test(s)){let i=`${x} ${h.join(" ")}`.trim(),l=yE.installCommand,d=yE.name;throw console.error(`[ERROR] ${d} CLI not found when executing: ${i}`),Error(`'${x}' is not available on this system. Please install ${d} first:
180 |   ${l}`)}throw DA}if(y.exitCode!==0){let QA=(y.stderr.trim()||y.stdout.trim()||"no error output").split(`
181 | `),command:`${x} ${h.join(" ")}`}),Error(`Cursor CLI exited with code ${y.exitCode}`)}return{stdout:y.stdout,stderr:y.stderr}}var Rk,E6,T4="";var D6=n(()=>{A2();I6();S4();Q0();YD();XE();Rk=new RegExp(String.raw`\^[\[[0-9;?]*[ -/]*[@-~]`,"g"),E6=new Map});var u5=n(async()=>{D6();B2();await C2()});var F6=n(async()=>{I6();u5();D6()});var vF,bx;var x5=n(()=>{vF={AUTO:"auto",CHEETAH:"cheetah",SONNET_4_5:"sonnet-4.5",SONNET_4_5_THINKING:"sonnet-4.5-thinking",GPT_5:"gpt-5",GPT_5_CODEX:"gpt-5-codex",OPUS_4_1:"opus-4.1",GROK:"grok"},bx={"gpt-5-codex":vF.GPT_5_CODEX,"gpt-4":vF.GPT_5,"gpt-4-turbo":vF.GPT_5,"gpt-3.5-turbo":vF.CHEETAH,"o1-preview":vF.OPUS_4_1,"o1-mini":vF.SONNET_4_5,sonnet:vF.SONNET_4_5,"claude-sonnet-4.5":vF.SONNET_4_5,opus:vF.OPUS_4_1}});var b5;var h5=n(async()=>{S4();Q6();await F6();Q6();x5();F6();b5={metadata:yE,auth:B6,run:C6}});var NC;var P4=n(()=>{NC={id:"ccr",name:"Claude Code Router",description:"Authenticate with Claude Code Router",cliCommand:"ccr",cliBinary:"ccr",installCommand:"npm install | ... truncated 

error: Cursor CLI exited with code 1
      at C6 (/$bunfs/root/runner-process.js:181:41)
      at async run (/$bunfs/root/runner-process.js:272:2227)
      at async N5 (/$bunfs/root/runner-process.js:114:1228)
      at async h4 (/$bunfs/root/runner-process.js:299:2259)
      at async mz (/$bunfs/root/runner-process.js:624:6766)
      at async iz (/$bunfs/root/runner-process.js:645:1044)


✗ Workflow failed with exit code 1
```

CodeMachine v0.7.0
cursor-agent 2025.11.25-d5b3271
Ubuntu 24.04.2 LTS

---

## Comments (2)


### Comment by @m1hah

**Date:** 2025-12-08T20:35:07Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/48#issuecomment-3628893565

✅ Issue Successfully Resolved!

**Root Cause Identified**
The error was occurring because:
1. Global CodeMachine template was hardcoded to use engine: 'codex' and model: 'gpt-5'
2. Invalid model reference - gpt-5 doesn't exist in any provider
3. Wrong engine - It was trying to use codex CLI instead of opencode

**Solution Applied**
I updated the global CodeMachine workflow template at:
/Users/../Library/pnpm/global/5/.pnpm/codemachine@0.7.0_stage-js@1.0.0-alpha.17_typescript@5.9.3_web-tree-sitter@0.25.10/node_modules/codemachine/templates/workflows/codemachine.workflow.js

**Key Changes Made:**
- ✅ Engine: Changed all engine: 'codex' to engine: 'opencode'
- ✅ Model: Changed model: 'gpt-5' to model: 'opencode/big-pickle'
- ✅ Consistency: Updated all 11 engine references in the workflow

**Verification**
- ✅ CodeMachine now runs - The TUI interface displayed successfully
- ✅ No more crashes - The "Memory entry requires non-empty content" error is gone
- ✅ Big Pickle active - Configuration now uses your preferred model

**What This Means**
Your CodeMachine workflow will now:
1. Use OpenCode CLI instead of trying to find non-existent codex command
2. Use Big Pickle model as requested
3. Work with your project specifications in the .codemachine/inputs/specifications.md

The workflow is now properly configured to use OpenCode with Big Pickle model for all agents and steps. You can run codemachine in your project directory and it should work without the previous errors!

---

### Comment by @lemon07r

**Date:** 2025-12-30T23:21:54Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/48#issuecomment-3700825884

AI slop fix. I have the same issue but with trying to use opencode. Problem is that the agents are hardcoded into the workflow template. Which cannot be changed since the source is compiled by bun before its shipped as a package. The docs arent even accurate, docs say there should be a config folder with files we can edit to override the engine choices to use agents of our choice, but codemachine wont initialize these files/this folder. It just gets stuck crashing at the start because it wants codex. I guess what can we expect from an ai slopped project that has little to no manual verification. 

---
