---
issue_number: 54
title: "Error after prompting /start"
state: OPEN
author: sollozzo13
created_at: 2025-12-07T11:14:13Z
updated_at: 2025-12-30T09:21:32Z
closed_at: N/A
labels: [bug]
comments_count: 4
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/54
backup_date: 2026-01-04T07:37:16Z
---

# #54: Error after prompting /start

**State:** OPEN
**Author:** @sollozzo13
**Created:** 2025-12-07T11:14:13Z
**Updated:** 2025-12-30T09:21:32Z
**Closed:** N/A
**Labels:** bug
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/54

---

## Description

I installed Codex, CodeMachine and OpenCode and completed the specifications file. When I run the /start command, I receive the error shown below. I am using Windows and performed the installation with npm. Second issue, Task Completion Checker uses Codex engine by default. It won't change to Opencode. I edited my codemachine. workflow.js. So I had to install Codex

 [↑↓] Navigate  [ENTER] Expand/View Logs  [H] History  [Ctrl+S] Skip  [Ctrl+C] Exit
[ERROR] Agent 2 (init) failed after 967ms: Memory entry requires non-empty content
Workflow execution failed: 35 | `);for(let l of p){if(!l.trim())continue;if(QA.captureFromStreamJson(l),L){let c=QA.getCaptured();if(c&&c.tokens){let zA=(c.tokens.input??0)+(c.tokens.cached??0);L({tokensIn:zA,tokensOut:c.tokens.output??0,cached:c.tokens.cached,cost:c.cost,duration:c.duration})}}let UA=VV(l);if(UA)M?.(UA+`
36 | `)}},onStderr:x?void 0:(d)=>{let i=b(d);N?.(i)},signal:k,stdioMode:x?"inherit":"pipe",timeout:v})}catch(d){let i=d,p=i?.message??"";if(i?.code==="ENOENT"||/not recognized as an internal or external command/i.test(p)||/command not found/i.test(p)){let UA=`${y} ${DA.join(" ")}`.trim(),c=qE.installCommand,zA=qE.name;throw console.error(`[ERROR] ${zA} CLI not found when executing: ${UA}`),Error(`'${y}' is not available on this system. Please install ${zA} first:
37 |   ${c}`)}throw d}if(s.exitCode!==0){let p=(s.stderr.trim()||s.stdout.trim()||"no error output").split(`
38 | `).slice(0,10).join(`
39 | `);throw console.error("[ERROR] Codex CLI execution failed",{exitCode:s.exitCode,error:p,command:`${y} ${DA.join(" ")}`}),Error(`Codex CLI exited with code ${s.exitCode}
40 | ${p}`)}return QA.logCapturedTelemetry(s.exitCode),{stdout:s.stdout,stderr:s.stderr}}var OV;var tM=n(()=>{A2();C4();Q0();Yw();ZD();XE();OV=new RegExp(String.raw`\^[\[[0-9;?]*[ -/]*[@-~]`,"g")});import{promises as F4}from"fs";import{join as TX}from"path";class _C{baseDir;analytics;constructor(B,I){this.baseDir=B,this.analytics=I}async append(B){await this.ensureBaseDir();let I=this.agentFilePath(B.agentId),C=await this.readEntriesFromFile(I);C.push(B),await F4.writeFile(I,JSON.stringify(C,null,2),"utf-8"),this.analytics?.onAppend?.({agentId:B.agentId,entry:B,source:"adapter"})}async read(B){await this.ensureBaseDir();let I=this.agentFilePath(B),C=await this.readEntriesFromFile(I);return this.analytics?.onRead?.({agentId:B,entries:C,source:"adapter"}),C}async readAll(){await this.ensureBaseDir();let B=await F4.readdir(this.baseDir).catch((C)=>{if(C.code==="ENOENT")return[];throw C}),I={};for(let C of B){if(!C.endsWith(".json"))continue;let g=C.replace(/\.json$/,""),H=await this.readEntriesFromFile(TX(this.bas | ... truncated

---

## Comments (4)


### Comment by @tarek-chaaban

**Date:** 2025-12-08T15:40:05Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/54#issuecomment-3627551684

same error 

---

### Comment by @m1hah

**Date:** 2025-12-08T20:35:23Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/54#issuecomment-3628894360

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

### Comment by @sollozzo13

**Date:** 2025-12-09T16:19:58Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/54#issuecomment-3633114179

I tried. I changed all engines to opencode Task Completion Checker is still 'codex' by default Here is my codemachine.workflow.js:



export default {
  name: 'CodeMachine Workflow',
  steps: [
    resolveStep('init', { executeOnce: true, engine: 'opencode', model: 'opencode/big-pickle', modelReasoningEffort: 'low' }), // Initialize development environment
    resolveStep('principal-analyst', { executeOnce: true, engine: 'opencode' }), // Review specifications and identify critical ambiguities
    resolveUI("∴ Planning Phase ∴"),
    resolveStep('blueprint-orchestrator', { executeOnce: true, engine: 'opencode' }), // Orchestrate architecture blueprint generation
    resolveStep('plan-agent', { executeOnce: true, engine: 'opencode', notCompletedFallback: 'plan-fallback' }), // Generate comprehensive iterative development plan with architectural artifacts
    resolveStep('task-breakdown', { executeOnce: true, engine: 'opencode' }), // Extract and structure tasks from project plan into JSON format
    resolveStep('git-commit', { executeOnce: true, engine: 'opencode' }), // Commit the task breakdown to git
    resolveUI("⟲ Development Cycle ⟲"),
    resolveStep('context-manager', { engine: 'opencode' }), // Gather and prepare relevant context from architecture, plan, and codebase for task execution
    resolveStep('code-generation', { engine: 'opencode' }), // Generate code implementation based on task specifications and design artifacts
    resolveStep('runtime-prep', { executeOnce: true, engine: 'opencode' }), // Generate robust shell scripts for project automation (install, run, lint, test)
    resolveStep('task-sanity-check', { engine: 'opencode' }), // Verify generated code against task requirements and acceptance criteria
    resolveStep('git-commit', { engine: 'opencode' }), // Commit the generated and verified code
    resolveUI("◈◈ Iteration Gate ◈◈"),
    resolveModule('check-task', { engine: 'opencode', loopSteps: 6, loopMaxIterations: 20,  loopSkip: ['runtime-prep']  }), // Loop back if tasks are not completed
  ],
  subAgentIds: [
    // architecture sub-agents
    'founder-architect',
    'structural-data-architect',
    'behavior-architect',
    'ui-ux-architect',
    'operational-architect',
    'file-assembler'
  ],
};

---

### Comment by @VanshRana12

**Date:** 2025-12-30T09:21:31Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/54#issuecomment-3698769064

> I tried. I changed all engines to opencode Task Completion Checker is still 'codex' by default Here is my codemachine.workflow.js:
> 
> export default { name: 'CodeMachine Workflow', steps: [ resolveStep('init', { executeOnce: true, engine: 'opencode', model: 'opencode/big-pickle', modelReasoningEffort: 'low' }), // Initialize development environment resolveStep('principal-analyst', { executeOnce: true, engine: 'opencode' }), // Review specifications and identify critical ambiguities resolveUI("∴ Planning Phase ∴"), resolveStep('blueprint-orchestrator', { executeOnce: true, engine: 'opencode' }), // Orchestrate architecture blueprint generation resolveStep('plan-agent', { executeOnce: true, engine: 'opencode', notCompletedFallback: 'plan-fallback' }), // Generate comprehensive iterative development plan with architectural artifacts resolveStep('task-breakdown', { executeOnce: true, engine: 'opencode' }), // Extract and structure tasks from project plan into JSON format resolveStep('git-commit', { executeOnce: true, engine: 'opencode' }), // Commit the task breakdown to git resolveUI("⟲ Development Cycle ⟲"), resolveStep('context-manager', { engine: 'opencode' }), // Gather and prepare relevant context from architecture, plan, and codebase for task execution resolveStep('code-generation', { engine: 'opencode' }), // Generate code implementation based on task specifications and design artifacts resolveStep('runtime-prep', { executeOnce: true, engine: 'opencode' }), // Generate robust shell scripts for project automation (install, run, lint, test) resolveStep('task-sanity-check', { engine: 'opencode' }), // Verify generated code against task requirements and acceptance criteria resolveStep('git-commit', { engine: 'opencode' }), // Commit the generated and verified code resolveUI("◈◈ Iteration Gate ◈◈"), resolveModule('check-task', { engine: 'opencode', loopSteps: 6, loopMaxIterations: 20, loopSkip: ['runtime-prep'] }), // Loop back if tasks are not completed ], subAgentIds: [ // architecture sub-agents 'founder-architect', 'structural-data-architect', 'behavior-architect', 'ui-ux-architect', 'operational-architect', 'file-assembler' ], };

+1

---
