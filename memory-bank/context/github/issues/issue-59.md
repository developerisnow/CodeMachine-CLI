---
issue_number: 59
title: "Stuck after /start"
state: OPEN
author: enving
created_at: 2025-12-11T19:47:16Z
updated_at: 2025-12-11T19:49:06Z
closed_at: N/A
labels: []
comments_count: 0
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/59
backup_date: 2026-01-04T07:37:16Z
---

# #59: Stuck after /start

**State:** OPEN
**Author:** @enving
**Created:** 2025-12-11T19:47:16Z
**Updated:** 2025-12-11T19:49:06Z
**Closed:** N/A
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/59

---

## Description

> Files Modified:
> 
> C:\Users\xx\AppData\Roaming\npm\node_modules\codemachine\templates\workflows\codemachine.workflow.js:4-18
> 
> Changed all engines from codex, claude, and cursor to opencode
> Added model specifications to all steps:
> opencode/big-pickle for most workflow steps (init, planning, task management, git commits)
> anthropic/claude-sonnet-4-5 for code generation and runtime prep steps
> C:\Users\xx\AppData\Roaming\npm\node_modules\codemachine\config\sub.agents.js:1-115
> 
> Added engine: 'opencode' and model: 'opencode/big-pickle' to all 15 sub-agents
> This includes both general sub-agents (UX/UI Designer, Frontend Dev, Backend Dev, etc.) and dev-codemachine architecture sub-agents
> The configuration now uses the opencode engine with the big-pickle model 
> 
> 
> Now started it again. It doesnt crash immediatly anymore 👍 
> 
> But it keeps stuck now... at time 00:19:
> 
> <img width="1886" height="916" alt="Image" src="https://github.com/user-attachments/assets/6170ae8d-31dc-4e90-84e1-0ba79f371dca" /> 

 _Originally posted by @enving in [#57](https://github.com/moazbuilds/CodeMachine-CLI/issues/57#issuecomment-3643463204)_


after pressing ENTER it exits and logs:
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ CodeMachine Workflow • 23:59 • Running...                                                                                                                                                         Tokens: 12.005in/107out (11.930 cached) │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
 [↑↓] Navigate  [ENTER] Expand/View Logs  [H] History  [Ctrl+S] Skip  [Ctrl+C] Exit
Workflow execution failed: 109 |
110 | `)),this.lockService.acquireLock(C.logPath).catch((W)=>{yF(`Failed to acquire lock for ${C.logPath}:`,W)}),$B(`Created log stream for agent ${B} at ${C.logPath}`),H}write(B,I){let C=this.activeStreams.get(B);if(!C)C=this.createStream(B);C.write(I)}async closeStream(B){let I=this.activeStreams.get(B);if(I){let g=HI.getInstance().getAgent(B);if(g)await this.lockService.releaseLock(g.logPath);I.end(),this.activeStreams.delete(B),$B(`Closed log stream for agent ${B}`)}}readLog(B){let C=HI.getInstance().getAgent(B);if(!C)throw Error(`Agent ${B} not found`);if(!O4(C.logPath))return`No log file found at ${C.logPath}`;try{return h$(C.logPath,"utf-8")}catch(g){return rC(`Failed to read log for agent ${B}: ${g}`),`Error reading log file: ${g}`}}async streamLogs(B,I){let g=HI.getInstance().getAgent(B);if(!g)throw Error(`Agent ${B} not found`);if(!O4(g.logPath)){I(`No log file found for agent ${B}
111 | `);return}if(g.status!=="running"){let H=this.readLog(B);I(H);return}await this.tailFile(g.logPath,I)}async tailFile(B,I){return new Promise((C,g)=>{try{let H=f$(B,{encoding:"utf-8"});H.on("data",(R)=>{I(R.toString())}),H.on("end",()=>{C()}),H.on("error",(R)=>{g(R)})}catch(H){g(H)}})}getLogStats(B){let C=HI.getInstance().getAgent(B);if(!C||!O4(C.logPath))return{size:0,exists:!1};return{size:b$(C.logPath).size,exists:!0}}getLogWriter(B){return(I)=>{this.write(B,I)}}async releaseAllLocks(){await this.lockService.releaseAllLocks()}getLogPath(B){return HI.getInstance().getAgent(B)?.logPath||null}}var kN=n(()=>{XE();eH();U5();ZD()});var H5=n(()=>{UN();XE()});var c0;var J5=n(()=>{eH();kN();XE();A2();c0=class c0{static isSetup=!1;static isCleaningUp=!1;static firstCtrlCPressed=!1;static firstCtrlCTime=0;static CTRL_C_DEBOUNCE_MS=500;static EXIT_STATUS_DELAY_MS=150;static workflowHandlers={};static registerWorkflowHandlers(B){this.workflowHandlers=B}static clearWorkflowHandlers(){this.workflowHandlers={}}static reset | ... truncated
112 | ${C.metadata.name} authentication required`),console.error(`
113 | Run the following command to authenticate:
114 | `),Error(`${C.metadata.name} authentication required`)}async function Y5(B,I,C){let{workingDir:g,projectRoot:H,engine:R,model:M,logger:N,stderrLogger:L,onTelemetry:k,abortSignal:v,timeout:h,parentId:W,disableMonitoring:O,ui:x,uniqueAgentId:b,displayPrompt:y}=C,DA=await tH(B,H??g),{registry:QA}=await Ow().then(() => TN),s;if(R)s=R;else if(DA.engine)s=DA.engine;else{let f=QA.getAll(),GA=null;for(let XA of f)if(await l$.isAuthenticated(XA.metadata.id,()=>XA.auth.isAuthenticated())){GA=XA;break}if(!GA)GA=QA.getDefault();if(!GA)throw Error("No engines registered. Please install at least one engine.");s=GA.metadata.id,PM(`No engine specified for agent '${B}', using ${GA.metadata.name} (${s})`)}await d$(s);let d=QA.get(s);if(!d)throw Error(`Engine not found: ${s}`);let i=M??DA.model??d.metadata.defaultModel,p=DA.modelReasoningEffort??d.metadata.defaultModelReasoningEffort,l=!O?HI.getInstance():null,UA=!O?MC.getInstance():null,c;if(l&&UA){let f=y||I;if(c=await l.register({name:B,prompt:f,parentId:W,engine:s,enginePro | ... truncated

error: Codex authentication required
      at d$ (B:/~BUN/root/runner-process.js:114:9)
      at async Y5 (B:/~BUN/root/runner-process.js:114:706)
      at async h4 (B:/~BUN/root/runner-process.js:299:2259)
      at async pz (B:/~BUN/root/runner-process.js:624:6766)

---

## Comments (0)

