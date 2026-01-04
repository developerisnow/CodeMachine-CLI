---
issue_number: 35
title: "Unexpected ProviderModelNotFoundError (gpt-5) When Running codemachine /start With engine: 'opencode'"
state: CLOSED
author: lolmc
created_at: 2025-11-26T22:37:22Z
updated_at: 2025-12-01T23:17:47Z
closed_at: 2025-11-27T18:58:44Z
labels: [help wanted]
comments_count: 4
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/35
backup_date: 2026-01-04T07:37:18Z
---

# #35: Unexpected ProviderModelNotFoundError (gpt-5) When Running codemachine /start With engine: 'opencode'

**State:** CLOSED
**Author:** @lolmc
**Created:** 2025-11-26T22:37:22Z
**Updated:** 2025-12-01T23:17:47Z
**Closed:** 2025-11-27T18:58:44Z
**Labels:** help wanted
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/35

---

## Description

When attempting to run an automated workflow using the `codemachine /start` command with a workflow file (`opencode.workflow.js`) explicitly configured to use `engine: 'opencode'`, the execution consistently fails with a `ProviderModelNotFoundError` related to `providerID: "gpt-5", modelID: ""`. This occurs despite individual steps or sub-agents within the same workflow executing correctly when explicitly instructed to use `opencode` as the engine.

The core issue appears to be that during the automated workflow execution, certain modules or steps (specifically, the 'Task Completion Checker' module has been consistently identified as the point of failure) are either not correctly inheriting or are actively overriding the `engine: 'opencode'` setting, leading them to attempt to invoke a `gpt-5` model which is not available or configured.

### Reproduction Steps

1.  **Workflow File (`opencode.workflow.js`):**
    The user's workflow file explicitly sets `engine: 'opencode'` for all steps and modules. Example snippet:
    ```javascript
    export default {
      name: 'CodeMachine Workflow',
      steps: [
        resolveStep('init', { executeOnce: true, engine: 'opencode' }),
        // ... other steps ...
        resolveModule('check-task', { engine: 'opencode', loopSteps: 6, loopMaxIterations: 20, loopSkip: ['runtime-prep'] }),
      ],
      // ...
    };
    ```

2.  **Agent/Module Configuration (`sub.agents.js`, `modules.js`):**
    Initially, these files (located in `/usr/local/lib/node_modules/codemachine/config/`) did not have an `engine` property defined for their respective agents/modules. Based on troubleshooting, `engine: 'opencode'` was added to each agent/module definition in these files. Example from `modules.js`:
    ```javascript
    module.exports = [
      {
        id: 'check-task',
        name: 'Task Completion Checker',
        description: 'Validates that all tasks are completed and signals whether to repeat workflow steps.',
        promptPath: path.join(promptsDir, 'templates', 'codemachine', 'workflows', 'task-verification-workflow.md'),
        engine: 'opencode', // Added during troubleshooting
        behavior: {
          type: 'loop',
          action: 'stepBack',
        },
      },
      // ... other modules with 'engine: 'opencode'' added
    ];
    ```

3.  **Execution:**
    Run the automated workflow: `codemachine /start`

### Expected Behavior

The workflow should execute successfully, with all agents and modules utilizing the `opencode` engine as specified in the workflow file and reinforced in the agent/module configuration files. No attempts should be made to call a `gpt-5` model unless explicitly configured to do so.

### Actual Behavior

The workflow fails with a `ProviderModelNotFoundError`, indicating an attempt to use `providerID: "gpt-5", modelID: ""`. The workflow output consistently points to the 'Task Completion Checker' module as the point where this failure occurs:

```
 ──── ◈◈ Iteration Gate ◈◈ ────
   ○ Task Completion Checker (codex)

...

ProviderModelNotFoundError:
ProviderModelNotFoundError
 data: {
  providerID: "gpt-5",
  modelID: "",
  suggestions: [],
},
at getModel (src/provider/provider.ts:610:13)
```

This indicates that despite explicit configuration of `engine: 'opencode'` for the `check-task` module (both as an override in the workflow and directly in `modules.js`), the system is still defaulting to, or being forced to use, a `gpt-5` model (which may be associated with a 'codex' context internally or as a fallback).

### Troubleshooting Performed

*   Initial error: `[ERROR] Codex CLI execution failed`.
*   Searched and replaced all explicit mentions of "codex" in accessible project files.
*   Added `engine: 'opencode'` to all sub-agent definitions in `sub.agents.js` and all module definitions in `modules.js`.
*   Confirmed through official documentation (`https://docs.codemachine.co/latest/customizing-workflows/`) that `engine` is a valid override option for `resolveStep()` and `resolveModule()`.
*   Confirmed that individual workflow steps using `opencode` execute successfully, indicating the `opencode` engine itself is functional when directly invoked.
*   The problem persists specifically during the automated `/start` workflow execution for the 'Task Completion Checker' module.

### Potential Area for Investigation

The discrepancy suggests an issue within the `codemachine`'s workflow orchestration logic when processing module configurations, particularly for the `/start` command. It seems the `engine` override or direct configuration for modules is not being correctly honored, leading to an unexpected fallback to a `gpt-5` model. Investigation into how `codemachine` resolves and applies engine settings for modules during automated workflow execution is recommended.

### Environment

*   **CodeMachine CLI Version:** v0.7.0
*   **Operating System:** Same fault has occured on Mac OS (macOS 15.7.2 (24G325)) and Linux (pop_os! 24 beta)
*   **Node.js Version:** Node version v25.1.0
*   **OpenCode Configuration:** 
* ➜  how_to_code_with_AI git:(main) ✗ cat opencode.workflow.js
export default {
  name: 'CodeMachine Workflow',
  steps: [
    resolveStep('init', { executeOnce: true, engine: 'opencode' }), // Initialize development environment
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

## Comments (4)


### Comment by @moazbuilds

**Date:** 2025-11-26T22:50:50Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/35#issuecomment-3583469330

It looks like you’re trying to customize your workflow to use the opencode engine, but for models, opencode relies on providers. The error you’re seeing is coming from opencode itself, not from CodeMachine.

In short, opencode can’t find a provider because its models are always namespaced by provider. For example, if you want the gpt-5 model from the opencode provider, the model name would be:

opencode/gpt-5

You can still use the opencode engine while using a different provider, like GitHub Copilot, in which case the model name might look like:

github-copilot/gpt-5

To see the exact model names (including providers), run this command in your terminal:

opencode models

Then copy the desired model name into your config file. 

Happy orchestrating! 

---

### Comment by @lolmc

**Date:** 2025-11-27T15:07:21Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/35#issuecomment-3586360753

Thanks for the feedback, I'll try that out when I get a chance.

Regards,

Lawrence McBride

Sent from [Proton Mail](https://proton.me/mail/home) for Android.

-------- Original Message --------
On Wednesday, 11/26/25 at 22:51 moazbuilds ***@***.***> wrote:

> moazbuilds left a comment [(moazbuilds/CodeMachine-CLI#35)](https://github.com/moazbuilds/CodeMachine-CLI/issues/35#issuecomment-3583469330)
>
> It looks like you’re trying to customize your workflow to use the opencode engine, but for models, opencode relies on providers. The error you’re seeing is coming from opencode itself, not from CodeMachine.
>
> In short, opencode can’t find a provider because its models are always namespaced by provider. For example, if you want the gpt-5 model from the opencode provider, the model name would be:
>
> opencode/gpt-5
>
> You can still use the opencode engine while using a different provider, like GitHub Copilot, in which case the model name might look like:
>
> github-copilot/gpt-5
>
> To see the exact model names (including providers), run this command in your terminal:
>
> opencode models
>
> Then copy the desired model name into your config file.
>
> Happy orchestrating!
>
> —
> Reply to this email directly, [view it on GitHub](https://github.com/moazbuilds/CodeMachine-CLI/issues/35#issuecomment-3583469330), or [unsubscribe](https://github.com/notifications/unsubscribe-auth/AA5SBK4PSNVHP3NDGNELTAT36YVGBAVCNFSM6AAAAACNJ353S6VHI2DSMVQWIX3LMV43OSLTON2WKQ3PNVWWK3TUHMZTKOBTGQ3DSMZTGA).
> You are receiving this because you authored the thread.Message ID: ***@***.***>

---

### Comment by @lolmc

**Date:** 2025-11-27T18:58:44Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/35#issuecomment-3587046772

I have tested your suggested fix and it is all working now. Thank you.

---

### Comment by @unixo

**Date:** 2025-12-01T23:17:47Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/35#issuecomment-3599391949

I had the same problem as OpenCode standalone works (it can use `lmstudio/qwen/qwen3-coder-30b`), but CodeMachine uses its own separate instance of OpenCode configuration in ~/.codemachine/opencode/, which doesn't include `~/.config/opencode/opencode.json`.

My solution was to create a symlink or copy the configuration:
`ln -sf ~/.config/opencode/opencode.json ~/.codemachine/opencode/opencode.json`

---
