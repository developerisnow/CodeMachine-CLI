---
issue_number: 32
title: "Opencode cli not picked as default / fallback engine"
state: OPEN
author: rjbaat
created_at: 2025-11-18T15:40:18Z
updated_at: 2025-12-07T22:55:46Z
closed_at: N/A
labels: [bug]
comments_count: 5
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/32
backup_date: 2026-01-04T07:37:18Z
---

# #32: Opencode cli not picked as default / fallback engine

**State:** OPEN
**Author:** @rjbaat
**Created:** 2025-11-18T15:40:18Z
**Updated:** 2025-12-07T22:55:46Z
**Closed:** N/A
**Labels:** bug
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/32

---

## Description

Hi, iam testing with: 

`codemachine start` but then its not picking opencode as default/fallback. How can I set a default cli or is this a bug?

then when trying:

`codemachine step init --engine opencode --model github-copilot/claude-sonnet-4.5` its giving me an error. I am logged into opencode with copilot credentials. . 

```
Init started to work.
545 |       providerID,
546 |       modelID,
547 |     })
548 | 
549 |     const provider = s.providers[providerID]
550 |     if (!provider) throw new ModelNotFoundError({ providerID, modelID })
                               ^
ProviderModelNotFoundError: ProviderModelNotFoundError
 data: {
  providerID: "github-copilot",
  modelID: "claude-sonnet-4.5",
},

```

It is working with default opencode provider and grok-code-fast-1 .

Opencode is working when directly interacting with copilot models.

---

## Comments (5)


### Comment by @moazbuilds

**Date:** 2025-11-18T15:56:41Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/32#issuecomment-3548348785

This bug fixed in the PR #30 

To use the updated version you need to clone the main branch and use 

```
uninstall -g codemachine
npm install
npm run build
npm link
```

then you can use codemachine globally as normal

---

### Comment by @rjbaat

**Date:** 2025-11-18T19:17:44Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/32#issuecomment-3549200475

Oke thnx. i will test it out.

I'm still having the question about the /start command. It's starting the process with codex. and all other tasks are also not set with opencode. How to make it use opencode. it's the only one that has auth in my setup. But it's still trying codex. 

---

### Comment by @moazbuilds

**Date:** 2025-11-18T19:21:41Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/32#issuecomment-3549222530

After you fork/clone the repo you will need to adjust codemachine.workflow.js 

to understand how to override the models read this: 
https://github.com/moazbuilds/CodeMachine-CLI/blob/main/docs/customizing-workflows.md#complete-override-options-reference

It will be easier to modify in the next versions through the TUI.. for now this is the only way.

---

### Comment by @moazbuilds

**Date:** 2025-11-18T19:24:13Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/32#issuecomment-3549232545

to know opencode models run opencode --models 
you will see the exact name for the provider/model

if you still have question join the new codemachine discord server ill be happy to help you out 
https://discord.gg/fxAgPnFG

---

### Comment by @thoroc

**Date:** 2025-12-07T22:55:46Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/32#issuecomment-3623687429

Do you not expose some config somewhere to set those values?

---
