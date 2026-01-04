---
issue_number: 40
title: "Crashes on /start"
state: OPEN
author: mrunkel
created_at: 2025-11-29T09:03:31Z
updated_at: 2025-12-08T20:15:12Z
closed_at: N/A
labels: [bug, needs investigation]
comments_count: 4
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/40
backup_date: 2026-01-04T07:37:17Z
---

# #40: Crashes on /start

**State:** OPEN
**Author:** @mrunkel
**Created:** 2025-11-29T09:03:31Z
**Updated:** 2025-12-08T20:15:12Z
**Closed:** N/A
**Labels:** bug, needs investigation
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/40

---

## Description

I updated the specifications file and did /start.

Here is the error that happened almost immediately:

````
 [↑↓] Navigate  [ENTER] Expand/View Logs  [H] History  [Ctrl+S] Skip  [Ctrl+C] Exit
Workflow execution failed: 230 | `),l=l.replace(/^.*\r([^\r\n]*)/gm,"$1"),W)l=l.replace(B7,"");return l=l.replace(/\n{3,}/g,`
231 |
232 | `),l},c;try{c=await ND({command:O,args:x,cwd:C,env:b,stdinInput:I,stdioMode:"pipe",onStdout:(i)=>{let l=s(i);y+=l;let d=y.split(`
233 | `);y=d.pop()??"";for(let UA of d)QA(UA)},onStderr:(i)=>{let l=s(i),d=HJ(l,W);N?.(d)},signal:k,timeout:v})}catch(i){let l=i,d=l?.message??"";if(l?.code==="ENOENT"||/not recognized as an internal or external command/i.test(d)||/command not found/i.test(d)){let p=[`'${O}' is not available on this system.`,"Install OpenCode via:","  npm i -g opencode-ai@latest","  brew install opencode","  scoop bucket add extras && scoop install extras/opencode","  choco install opencode","Docs: https://opencode.ai/docs"].join(`
234 | `);throw BE.error(`${_E.name} CLI not found when executing: ${O} ${x.join(" ")}`),Error(p)}throw i}if(y.trim())QA(y),y="";if(c.exitCode!==0){let i=c.stderr.trim(),l=c.stdout.trim(),d=(i||l||"no error output").split(`
235 | `);throw BE.error("OpenCode CLI execution failed",{exitCode:c.exitCode,sample:d,command:`${O} ${x.join(" ")}`}),Error(`OpenCode CLI exited with code ${c.exitCode}`)}return h.logCapturedTelemetry(c.exitCode),{stdout:c.stdout,stderr:c.stderr}}var B7,xk=(B,I=100)=>B.length>I?`${B.slice(0,I)}...`:B;var V6=n(()=>{A2();P4();j4();YD();eg();Yw();B7=new RegExp(String.raw`\^[\[[0-9;?]*[ -/]*[@-~]`,"g")});import*as Q7 from"path";function $6(){return process.env.CODEMACHINE_SKIP_OPENCODE==="1"}async function mk(B){if($6()){console.log(`[dry-run] ${B.agentId}: ${B.prompt.slice(0,80)}...`);return}await kw({prompt:B.prompt,workingDir:B.cwd,model:B.model,agent:B.agent,onData:(I)=>{try{process.stdout.write(I)}catch{}},onErrorData:(I)=>{try{process.stderr.write(I)}catch{}}})}async function pk(B,I,C,g={}){let H=g.logger??((k)=>{try{process.stdout.write(k)}catch{}}),R=g.stderrLogger??((k)=>{try{process.stderr.write(k)}catch{}});if($6())return H(`[dry-run] ${B}: ${I.slice(0,120)}...`),"";let M="",N=await kw({prompt:I,workingDi | ... truncated
````

opencode is installed on the system

---

## Comments (4)


### Comment by @brandensilva

**Date:** 2025-11-30T04:23:31Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/40#issuecomment-3592181607

Similar issue here.

Mac Sequoia 15.6
OpenCode: 1.0.122
Node 24.8.0
Codemachine: 0.7.0

Specifications.md is set, try a /start and the following error happens:

```
[ERROR] Agent 6 (init) failed after 1120ms: Memory entry requires non-empty content
Workflow execution failed: 35 | `);for(let d of l){if(!d.trim())continue;if(QA.captureFromStreamJson(d),L){let p=QA.getCaptured();if(p&&p.tokens){let zA=(p.tokens.input??0)+(p.tokens.cached??0);L({tokensIn:zA,tokensOut:p.tokens.output??0,cached:p.tokens.cached,cost:p.cost,duration:p.duration})}}let UA=VV(d);if(UA)M?.(UA+`
36 | `)}},onStderr:x?void 0:(c)=>{let i=h(c);N?.(i)},signal:k,stdioMode:x?"inherit":"pipe",timeout:v})}catch(c){let i=c,l=i?.message??"";if(i?.code==="ENOENT"||/not recognized as an internal or external command/i.test(l)||/command not found/i.test(l)){let UA=`${y} ${DA.join(" ")}`.trim(),p=qE.installCommand,zA=qE.name;throw console.error(`[ERROR] ${zA} CLI not found when executing: ${UA}`),Error(`'${y}' is not available on this system. Please install ${zA} first:
37 |   ${p}`)}throw c}if(s.exitCode!==0){let l=(s.stderr.trim()||s.stdout.trim()||"no error output").split(`
38 | `).slice(0,10).join(`
39 | `);throw console.error("[ERROR] Codex CLI execution failed",{exitCode:s.exitCode,error:l,command:`${y} ${DA.join(" ")}`}),Error(`Codex CLI exited with code ${s.exitCode}
40 | ${l}`)}return QA.logCapturedTelemetry(s.exitCode),{stdout:s.stdout,stderr:s.stderr}}var OV;var tM=n(()=>{A2();C4();Q0();Yw();YD();XE();OV=new RegExp(String.raw`\^[\[[0-9;?]*[ -/]*[@-~]`,"g")});import{promises as F4}from"fs";import{join as TX}from"path";class _C{baseDir;analytics;constructor(B,I){this.baseDir=B,this.analytics=I}async append(B){await this.ensureBaseDir();let I=this.agentFilePath(B.agentId),C=await this.readEntriesFromFile(I);C.push(B),await F4.writeFile(I,JSON.stringify(C,null,2),"utf-8"),this.analytics?.onAppend?.({agentId:B.agentId,entry:B,source:"adapter"})}async read(B){await this.ensureBaseDir();let I=this.agentFilePath(B),C=await this.readEntriesFromFile(I);return this.analytics?.onRead?.({agentId:B,entries:C,source:"adapter"}),C}async readAll(){await this.ensureBaseDir();let B=await F4.readdir(this.baseDir).catch((C)=>{if(C.code==="ENOENT")return[];throw C}),I={};for(let C of B){if(!C.endsWith(".json"))continue;let g=C.replace(/\.json$/,""),H=await this.readEntriesFromFile(TX(this.bas | ... truncated 

error: Memory entry requires non-empty content
      at ensureRequiredFields (/$bunfs/root/runner-process.js:40:2437)
      at append (/$bunfs/root/runner-process.js:40:1669)
      at append (/$bunfs/root/runner-process.js:40:1790)
      at N5 (/$bunfs/root/runner-process.js:114:1820)
      at async b4 (/$bunfs/root/runner-process.js:299:2259)
      at async mz (/$bunfs/root/runner-process.js:624:6766)
      at async iz (/$bunfs/root/runner-process.js:645:1044)
```

I use Claude Code and dabble with Open Code but I do not use Codex CLI. I logged into Claude Code with /login but seems to not take? I'll give Codex CLI an install just to see if that fixes the error above.

---

### Comment by @MathieuDoyon

**Date:** 2025-12-01T02:15:33Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/40#issuecomment-3594238263

I have the same. I did codemachine login with opencode
them trying to to codemachine `/start` I have the same error.

the log in `.codemachine/logs` show this.
```
[CYAN]===╭─ Agent 1: init ────────────────────────────────────────────────
[CYAN]   Started: 2025-12-01 00:36:41
[CYAN]   Prompt: **Persona:** `init` agent.
[CYAN]╰───────────────────────────────────────────────────────────────

[STDERR] 605 |     const provider = s.providers[providerID]
606 |     if (!provider) {
607 |       const availableProviders = Object.keys(s.providers)
608 |       const matches = fuzzysort.go(providerID, availableProviders, { limit: 3, threshold: -10000 })
609 |       const suggestions = matches.map((m) => m.target)
610 |       throw new ModelNotFoundError({ providerID, modelID, suggestions })
                  ^
ProviderModelNotFoundError: ProviderModelNotFoundError
 data: {
  providerID: "gpt-5",
  modelID: "",
  suggestions: [],
},

      at getModel (src/provider/provider.ts:610:13)

Init failed: Memory entry requires non-empty content

```

---

### Comment by @enerage

**Date:** 2025-12-01T07:53:38Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/40#issuecomment-3595097192

Same for me

---

### Comment by @LegendEvent

**Date:** 2025-12-08T20:15:12Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/40#issuecomment-3628829505


> Similar issue here.
> 
> Mac Sequoia 15.6 OpenCode: 1.0.122 Node 24.8.0 Codemachine: 0.7.0
> 
> Specifications.md is set, try a /start and the following error happens:
> 
> ```
> [ERROR] Agent 6 (init) failed after 1120ms: Memory entry requires non-empty content
> Workflow execution failed: 35 | `);for(let d of l){if(!d.trim())continue;if(QA.captureFromStreamJson(d),L){let p=QA.getCaptured();if(p&&p.tokens){let zA=(p.tokens.input??0)+(p.tokens.cached??0);L({tokensIn:zA,tokensOut:p.tokens.output??0,cached:p.tokens.cached,cost:p.cost,duration:p.duration})}}let UA=VV(d);if(UA)M?.(UA+`
> 36 | `)}},onStderr:x?void 0:(c)=>{let i=h(c);N?.(i)},signal:k,stdioMode:x?"inherit":"pipe",timeout:v})}catch(c){let i=c,l=i?.message??"";if(i?.code==="ENOENT"||/not recognized as an internal or external command/i.test(l)||/command not found/i.test(l)){let UA=`${y} ${DA.join(" ")}`.trim(),p=qE.installCommand,zA=qE.name;throw console.error(`[ERROR] ${zA} CLI not found when executing: ${UA}`),Error(`'${y}' is not available on this system. Please install ${zA} first:
> 37 |   ${p}`)}throw c}if(s.exitCode!==0){let l=(s.stderr.trim()||s.stdout.trim()||"no error output").split(`
> 38 | `).slice(0,10).join(`
> 39 | `);throw console.error("[ERROR] Codex CLI execution failed",{exitCode:s.exitCode,error:l,command:`${y} ${DA.join(" ")}`}),Error(`Codex CLI exited with code ${s.exitCode}
> 40 | ${l}`)}return QA.logCapturedTelemetry(s.exitCode),{stdout:s.stdout,stderr:s.stderr}}var OV;var tM=n(()=>{A2();C4();Q0();Yw();YD();XE();OV=new RegExp(String.raw`\^[\[[0-9;?]*[ -/]*[@-~]`,"g")});import{promises as F4}from"fs";import{join as TX}from"path";class _C{baseDir;analytics;constructor(B,I){this.baseDir=B,this.analytics=I}async append(B){await this.ensureBaseDir();let I=this.agentFilePath(B.agentId),C=await this.readEntriesFromFile(I);C.push(B),await F4.writeFile(I,JSON.stringify(C,null,2),"utf-8"),this.analytics?.onAppend?.({agentId:B.agentId,entry:B,source:"adapter"})}async read(B){await this.ensureBaseDir();let I=this.agentFilePath(B),C=await this.readEntriesFromFile(I);return this.analytics?.onRead?.({agentId:B,entries:C,source:"adapter"}),C}async readAll(){await this.ensureBaseDir();let B=await F4.readdir(this.baseDir).catch((C)=>{if(C.code==="ENOENT")return[];throw C}),I={};for(let C of B){if(!C.endsWith(".json"))continue;let g=C.replace(/\.json$/,""),H=await this.readEntriesFromFile(TX(this.bas | ... truncated 
> 
> error: Memory entry requires non-empty content
>       at ensureRequiredFields (/$bunfs/root/runner-process.js:40:2437)
>       at append (/$bunfs/root/runner-process.js:40:1669)
>       at append (/$bunfs/root/runner-process.js:40:1790)
>       at N5 (/$bunfs/root/runner-process.js:114:1820)
>       at async b4 (/$bunfs/root/runner-process.js:299:2259)
>       at async mz (/$bunfs/root/runner-process.js:624:6766)
>       at async iz (/$bunfs/root/runner-process.js:645:1044)
> ```
> 
> I use Claude Code and dabble with Open Code but I do not use Codex CLI. I logged into Claude Code with /login but seems to not take? I'll give Codex CLI an install just to see if that fixes the error above.

I had a similar/same issue today. The issue was because of the cloned main branch repo, which is actually WIP atm. So i downloaded the sources from release v0.7.0 and added the 2 lines fix from [PR 38](https://github.com/moazbuilds/CodeMachine-CLI/pull/38). 
then relog your authentication in codemachine-cli and it should work. 
codemachine auth logout 
codemachine auth login

<img width="1739" height="749" alt="Image" src="https://github.com/user-attachments/assets/b419b26c-8784-4603-b315-0a413440bf10" />

maybe its worth a try

---
