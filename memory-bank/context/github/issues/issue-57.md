---
issue_number: 57
title: "Error at /start"
state: OPEN
author: enving
created_at: 2025-12-11T12:16:50Z
updated_at: 2025-12-11T19:28:44Z
closed_at: N/A
labels: [bug, duplicate, good first issue]
comments_count: 7
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/57
backup_date: 2026-01-04T07:37:16Z
---

# #57: Error at /start

**State:** OPEN
**Author:** @enving
**Created:** 2025-12-11T12:16:50Z
**Updated:** 2025-12-11T19:28:44Z
**Closed:** N/A
**Labels:** bug, duplicate, good first issue
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/57

---

## Description

When openeing cm and /login:
opencode is already authenticated.

Then I customized the specifications.md

and startet:
/start


then this error:

Error:

│ CodeMachine Workflow • 00:09 • Running...                                                                                                                                                                                Tokens: 0in/0out │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
 [↑↓] Navigate  [ENTER] Expand/View Logs  [H] History  [Ctrl+S] Skip  [Ctrl+C] Exit
[ERROR] Agent 3 (init) failed after 3123ms: Memory entry requires non-empty content
Workflow execution failed: 35 | `);for(let l of p){if(!l.trim())continue;if(QA.captureFromStreamJson(l),L){let c=QA.getCaptured();if(c&&c.tokens){let zA=(c.tokens.input??0)+(c.tokens.cached??0);L({tokensIn:zA,tokensOut:c.tokens.output??0,cached:c.tokens.cached,cost:c.cost,duration:c.duration})}}let UA=VV(l);if(UA)M?.(UA+`
36 | `)}},onStderr:x?void 0:(d)=>{let i=b(d);N?.(i)},signal:k,stdioMode:x?"inherit":"pipe",timeout:v})}catch(d){let i=d,p=i?.message??"";if(i?.code==="ENOENT"||/not recognized as an internal or external command/i.test(p)||/command not found/i.test(p)){let UA=`${y} ${DA.join(" ")}`.trim(),c=qE.installCommand,zA=qE.name;throw console.error(`[ERROR] ${zA} CLI not found when executing: ${UA}`),Error(`'${y}' is not available on this system. Please install ${zA} first:
37 |   ${c}`)}throw d}if(s.exitCode!==0){let p=(s.stderr.trim()||s.stdout.trim()||"no error output").split(`
38 | `).slice(0,10).join(`
39 | `);throw console.error("[ERROR] Codex CLI execution failed",{exitCode:s.exitCode,error:p,command:`${y} ${DA.join(" ")}`}),Error(`Codex CLI exited with code ${s.exitCode}
40 | ${p}`)}return QA.logCapturedTelemetry(s.exitCode),{stdout:s.stdout,stderr:s.stderr}}var OV;var tM=n(()=>{A2();C4();Q0();Yw();ZD();XE();OV=new RegExp(String.raw`\^[\[[0-9;?]*[ -/]*[@-~]`,"g")});import{promises as F4}from"fs";import{join as TX}from"path";class _C{baseDir;analytics;constructor(B,I){this.baseDir=B,this.analytics=I}async append(B){await this.ensureBaseDir();let I=this.agentFilePath(B.agentId),C=await this.readEntriesFromFile(I);C.push(B),await F4.writeFile(I,JSON.stringify(C,null,2),"utf-8"),this.analytics?.onAppend?.({agentId:B.agentId,entry:B,source:"adapter"})}async read(B){await this.ensureBaseDir();let I=this.agentFilePath(B),C=await this.readEntriesFromFile(I);return this.analytics?.onRead?.({agentId:B,entries:C,source:"adapter"}),C}async readAll(){await this.ensureBaseDir();let B=await F4.readdir(this.baseDir).catch((C)=>{if(C.code==="ENOENT")return[];throw C}),I={};for(let C of B){if(!C.endsWith(".json"))continue;let g=C.replace(/\.json$/,""),H=await this.readEntriesFromFile(TX(this.bas | ... truncated

error: Memory entry requires non-empty content
      at ensureRequiredFields (B:/~BUN/root/runner-process.js:40:2437)
      at append (B:/~BUN/root/runner-process.js:40:1669)
      at append (B:/~BUN/root/runner-process.js:40:1790)
      at Y5 (B:/~BUN/root/runner-process.js:114:1820)
      at async h4 (B:/~BUN/root/runner-process.js:299:2259)
      at async pz (B:/~BUN/root/runner-process.js:624:6766)
      at async sz (B:/~BUN/root/runner-process.js:645:1044)

---

## Comments (7)


### Comment by @sollozzo13

**Date:** 2025-12-11T14:37:09Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/57#issuecomment-3642231331

I had same problem. I installed Codex CLI. Codex must be authenticated. It works now. But Task Completion Checker process never ends. Look https://github.com/moazbuilds/CodeMachine-CLI/issues/54

---

### Comment by @moazbuilds

**Date:** 2025-12-11T14:40:33Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/57#issuecomment-3642246375

This is a bug in version 0.7.0. To fix it, you'll need to edit your global npm codemachine installation config files:
Locate your global codemachine folder and open templates/workflows/codemachine.workflow.js.

Change all engines to opencode and update models to your specific model name. (Run `opencode models` command to find the exact ID, e.g., opencode/big-pickle).

Do the same for config/sub.agents.js. You can use any model or provider you prefer there.

like those examples:

![Image](https://github.com/user-attachments/assets/d89ee3cc-b624-4f2b-91fd-55d74f901188)

![Image](https://github.com/user-attachments/assets/e16a8684-ee64-4564-bc5e-6d3e632bcb28)

---

### Comment by @moazbuilds

**Date:** 2025-12-11T14:43:13Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/57#issuecomment-3642256850

- [x] Related to #54 

---

### Comment by @moazbuilds

**Date:** 2025-12-11T14:45:42Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/57#issuecomment-3642268008

> I had same problem. I installed Codex CLI. Codex must be authenticated. It works now. But Task Completion Checker process never ends. Look [#54](https://github.com/moazbuilds/CodeMachine-CLI/issues/54)

Look #38 

---

### Comment by @enving

**Date:** 2025-12-11T18:59:27Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/57#issuecomment-3643356014

> This is a bug in version 0.7.0. To fix it, you'll need to edit your global npm codemachine installation config files: Locate your global codemachine folder and open templates/workflows/codemachine.workflow.js.
> 
> Change all engines to opencode and update models to your specific model name. (Run `opencode models` command to find the exact ID, e.g., opencode/big-pickle).
> 
> Do the same for config/sub.agents.js. You can use any model or provider you prefer there.
> 

Thanks 
However I wont find the mentioned "global codemachine folder"

---

### Comment by @enving

**Date:** 2025-12-11T19:16:01Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/57#issuecomment-3643410860

ok sorry found it on windows: \AppData\Roaming\npm\node_modules\codemachine\templates\workflows\codem

---

### Comment by @enving

**Date:** 2025-12-11T19:28:43Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/57#issuecomment-3643463204

Files Modified:

C:\Users\xx\AppData\Roaming\npm\node_modules\codemachine\templates\workflows\codemachine.workflow.js:4-18

Changed all engines from codex, claude, and cursor to opencode
Added model specifications to all steps:
opencode/big-pickle for most workflow steps (init, planning, task management, git commits)
anthropic/claude-sonnet-4-5 for code generation and runtime prep steps
C:\Users\xx\AppData\Roaming\npm\node_modules\codemachine\config\sub.agents.js:1-115

Added engine: 'opencode' and model: 'opencode/big-pickle' to all 15 sub-agents
This includes both general sub-agents (UX/UI Designer, Frontend Dev, Backend Dev, etc.) and dev-codemachine architecture sub-agents
The configuration now uses the opencode engine with the big-pickle model 


Now started it again. It doesnt crash immediatly anymore 👍 

But it keeps stuck now... at time 00:19:

<img width="1886" height="916" alt="Image" src="https://github.com/user-attachments/assets/6170ae8d-31dc-4e90-84e1-0ba79f371dca" />

---
