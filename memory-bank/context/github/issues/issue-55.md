---
issue_number: 55
title: "Program crash because no tasks exists."
state: OPEN
author: dxmone
created_at: 2025-12-10T08:58:36Z
updated_at: 2025-12-11T15:00:23Z
closed_at: N/A
labels: [needs investigation]
comments_count: 4
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/55
backup_date: 2026-01-04T07:37:16Z
---

# #55: Program crash because no tasks exists.

**State:** OPEN
**Author:** @dxmone
**Created:** 2025-12-10T08:58:36Z
**Updated:** 2025-12-11T15:00:23Z
**Closed:** N/A
**Labels:** needs investigation
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/55

---

## Description

I am trying to test this project but it stops for me. It did not create the tasks and if i go in the completed steps and try to rerun it the app always crashes anyway. It's doing the Git Commit Agent and after that the app crash. 

The template.json is.
```
{
  "activeTemplate": "codemachine.workflow.js",
  "lastUpdated": "2025-12-10T08:56:30.630Z",
  "completedSteps": [
    0,
    1,
    3,
    4,
    5,
    6
  ],
  "notCompletedSteps": [
    7,
    8
  ],
  "resumeFromLastStep": true
}
```

[↑↓] Navigate  [ENTER] Expand/View Logs  [H] History  [Ctrl+S] Skip  [Ctrl+C] Exit
Workflow execution failed: 294 | 3. If not empty, remove all numbers from "notCompletedSteps" array
295 | 4. Or set "resumeFromLastStep": false to disable this feature
296 |
297 | Example:
298 | "notCompletedSteps": []  \u2190 Empty array means no incomplete steps to resume
299 | `.trim();return new p7(C,B,I)}function HS(B,I){}function c7(B,I,C,g){if(C)return HS(B,I),"";throw US(B,I)}var p7;var l7=n(()=>{p7=class p7 extends Error{placeholderName;filePath;constructor(B,I,C){super(B);this.placeholderName=I;this.filePath=C;this.name="PlaceholderError"}}});import{readFile as Kf,stat as d7}from"fs/promises";class s7{cache=new Map;maxSize=100;async get(B){let I=this.cache.get(B);if(!I)return null;try{if((await d7(B)).mtimeMs===I.mtime)return I.content;return this.cache.delete(B),null}catch{return this.cache.delete(B),null}}async set(B,I){try{let C=await d7(B);if(this.cache.size>=this.maxSize){let g=this.cache.keys().next().value;if(g)this.cache.delete(g)}this.cache.set(B,{content:I,mtime:C.mtimeMs})}catch{}}clear(){this.cache.clear()}}async function JS(B,I){let C=await i7.get(I);if(C!==null)return C;let g=await b7(B,I);return await i7.set(I,g),g}async function KS(B,I){let C=BY(),g=B,H=QY(B),R=f7(B),N=Array.from(R).map(async(k)=>{let b=H.find((h)=>h.name===k)?.isOptional||!1,W=T7(k,I,C);if(! | ... truncated

PlaceholderError: ❌ Error: {all_tasks_json} is required to complete this stage and provide high-quality results.

Expected file: .codemachine/artifacts/tasks/*.json

If you want to step back and skip this stage:
1. Edit .codemachine/template.json
2. Remove the step number from "completedSteps" array

Example:
"completedSteps": [0, 1, 2]  ← Remove the last number to re-run that step

To disable resume from last step (start workflow from beginning):
1. Edit .codemachine/template.json
2. Check if "notCompletedSteps" array is empty: []
3. If not empty, remove all numbers from "notCompletedSteps" array
4. Or set "resumeFromLastStep": false to disable this feature

Example:
"notCompletedSteps": []  ← Empty array means no incomplete steps to resume
"resumeFromLastStep": false  ← Disables the resume feature entirely
 placeholderName: "all_tasks_json",
   filePath: ".codemachine/artifacts/tasks/*.json",

      at US (/$bunfs/root/runner-process.js:299:17)
      at c7 (/$bunfs/root/runner-process.js:299:101)
      at <anonymous> (/$bunfs/root/runner-process.js:299:1309)
      at async KS (/$bunfs/root/runner-process.js:299:1390)

---

## Comments (4)


### Comment by @cirotix

**Date:** 2025-12-10T12:10:06Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/55#issuecomment-3636783704

Greetings,

I have the exact same issue since yesterday.
I already have build 2 applications with this with great success (I am totally amazed by codemachine, congratulation).

However I have tries to start an new one, and it stopped with the same error:

```
Workflow execution failed: 294 | 3. If not empty, remove all numbers from "notCompletedSteps" array
295 | 4. Or set "resumeFromLastStep": false to disable this feature
296 | 
297 | Example:
298 | "notCompletedSteps": []  \u2190 Empty array means no incomplete steps to resume
299 | `.trim();return new p7(C,B,I)}function HS(B,I){}function c7(B,I,C,g){if(C)return HS(B,I),"";throw US(B,I)}var p7;var l7=n(()=>{p7=class p7 extends Error{placeholderName;filePath;constructor(B,I,C){super(B);this.placeholderName=I;this.filePath=C;this.name="PlaceholderError"}}});import{readFile as Kf,stat as d7}from"fs/promises";class s7{cache=new Map;maxSize=100;async get(B){let I=this.cache.get(B);if(!I)return null;try{if((await d7(B)).mtimeMs===I.mtime)return I.content;return this.cache.delete(B),null}catch{return this.cache.delete(B),null}}async set(B,I){try{let C=await d7(B);if(this.cache.size>=this.maxSize){let g=this.cache.keys().next().value;if(g)this.cache.delete(g)}this.cache.set(B,{content:I,mtime:C.mtimeMs})}catch{}}clear(){this.cache.clear()}}async function JS(B,I){let C=await i7.get(I);if(C!==null)return C;let g=await b7(B,I);return await i7.set(I,g),g}async function KS(B,I){let C=BY(),g=B,H=QY(B),R=f7(B),N=Array.from(R).map(async(k)=>{let b=H.find((h)=>h.name===k)?.isOptional||!1,W=T7(k,I,C);if(! | ... truncated 

PlaceholderError: ❌ Error: {architecture} is required to complete this stage and provide high-quality results.

Expected file: .codemachine/artifacts/architecture/*.md

If you want to step back and skip this stage:
1. Edit .codemachine/template.json
2. Remove the step number from "completedSteps" array

Example:
"completedSteps": [0, 1, 2]  ← Remove the last number to re-run that step

To disable resume from last step (start workflow from beginning):
1. Edit .codemachine/template.json
2. Check if "notCompletedSteps" array is empty: []
3. If not empty, remove all numbers from "notCompletedSteps" array
4. Or set "resumeFromLastStep": false to disable this feature

Example:
"notCompletedSteps": []  ← Empty array means no incomplete steps to resume
"resumeFromLastStep": false  ← Disables the resume feature entirely
 placeholderName: "architecture",
   filePath: ".codemachine/artifacts/architecture/*.md",

      at US (/$bunfs/root/runner-process.js:299:17)
      at c7 (/$bunfs/root/runner-process.js:299:101)
      at <anonymous> (/$bunfs/root/runner-process.js:299:1309)
      at async KS (/$bunfs/root/runner-process.js:299:1390)
```

I have tried to delete all the codemachine files, kept only my specification, with no luck.

I have also tried to change the template.json as mentionned, no luck either.

My setup:
* Linux Debian 12
* codemachine 0.70
* login with claude (also tried with login with claude + codex)
As I have not changed anything in codemachine (no update), I suspect some changes with Claude API.

---

### Comment by @cirotix

**Date:** 2025-12-10T12:15:01Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/55#issuecomment-3636801307

It is not Claude API, as I have launch codemachine with just codex, and same issue happens.

---

### Comment by @cirotix

**Date:** 2025-12-10T13:31:31Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/55#issuecomment-3637104421

Actually I deleted all inside my .codemachine folder (but my specs). So the agents were missing. I fixed by removing template.ison running /templates again.

---

### Comment by @moazbuilds

**Date:** 2025-12-11T15:00:23Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/55#issuecomment-3642339665

Please share the logs from the task-breakdown agent in the .codemachine/logs directory.

---
