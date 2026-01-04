---
issue_number: 24
title: "Add GitHub Copilot CLI Support"
state: OPEN
author: nikitabraganov
created_at: 2025-11-08T15:38:21Z
updated_at: 2025-11-18T16:06:31Z
closed_at: N/A
labels: [Engine Support]
comments_count: 6
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/24
backup_date: 2026-01-04T07:37:18Z
---

# #24: Add GitHub Copilot CLI Support

**State:** OPEN
**Author:** @nikitabraganov
**Created:** 2025-11-08T15:38:21Z
**Updated:** 2025-11-18T16:06:31Z
**Closed:** N/A
**Labels:** Engine Support
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/24

---

## Description

It would be a nice addition for the GitHub copilot CLI.

https://github.com/features/copilot/cli/

---

## Comments (6)


### Comment by @oldschoola

**Date:** 2025-11-12T10:46:04Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/24#issuecomment-3521286994

workstation@workstation:~/IdeaProjects/prohibiton-client$ codemachine step arch-agent --engine opencode --model github-copilot/gpt-5-codex
════════════════════════════════════════════════════════════════════════════════
Architecture Agent started to work.
520 |       providerID,
521 |       modelID,
522 |     })
523 | 
524 |     const provider = s.providers[providerID]
525 |     if (!provider) throw new ModelNotFoundError({ providerID, modelID })
                               ^
ProviderModelNotFoundError: ProviderModelNotFoundError
 data: {
  providerID: "github-copilot",
  modelID: "gpt-5-codex",
},

      at getModel (src/provider/provider.ts:525:26)

---

### Comment by @nikitabraganov

**Date:** 2025-11-12T14:31:51Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/24#issuecomment-3522248415

The issue I think is that opencode is not really maintained (from what i have checked on their repo related to the available models from gh copilot and number of open PRs)

---

### Comment by @moazbuilds

**Date:** 2025-11-12T16:31:01Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/24#issuecomment-3522808819

Hi, after adding OpenCode and CCR, we do have additional engines on our roadmap, but they’re not scheduled in the near term. In the meantime, we’re open to community contributions for new engines. You can review the existing PRs, contributors have been actively adding engines, and we’ve created a simple Notion guide to help contributors implement their own. When reviewing past PRs and the subsequent improvements, you’ll see common pitfalls, mostly related to overriding the home directory, authentication, and logging.

https://www.notion.so/1ed66323847280aa96c1ee5295053ad4

---

### Comment by @oldschoola

**Date:** 2025-11-12T18:35:50Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/24#issuecomment-3523381852

> The issue I think is that opencode is not really maintained (from what i have checked on their repo related to the available models from gh copilot and number of open PRs)

are you sure you not looking at a old repo. opencode is still maintained https://github.com/sst/opencode

---

### Comment by @nikitabraganov

**Date:** 2025-11-13T08:07:45Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/24#issuecomment-3526255906

> > The issue I think is that opencode is not really maintained (from what i have checked on their repo related to the available models from gh copilot and number of open PRs)
> 
> are you sure you not looking at a old repo. opencode is still maintained https://github.com/sst/opencode

Ineed that is the case😑

---

### Comment by @LegendEvent

**Date:** 2025-11-17T23:28:58Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/24#issuecomment-3544279602

> Hi, after adding OpenCode and CCR, we do have additional engines on our roadmap, but they’re not scheduled in the near term. In the meantime, we’re open to community contributions for new engines. You can review the existing PRs, contributors have been actively adding engines, and we’ve created a simple Notion guide to help contributors implement their own. When reviewing past PRs and the subsequent improvements, you’ll see common pitfalls, mostly related to overriding the home directory, authentication, and logging.
> 
> https://www.notion.so/1ed66323847280aa96c1ee5295053ad4

### Additional context: OpenCode engine + GitHub Copilot provider fails with `ProviderModelNotFoundError`

I’ve been testing CodeMachine’s **OpenCode engine** with **GitHub Copilot** as an LLM provider, and I’m hitting a consistent failure that feels closely related to this request for GitHub Copilot CLI support.

Short version:  

- **OpenCode + GitHub Copilot works fine when called directly.**  
- **The same provider/models fail with `ProviderModelNotFoundError` when invoked via CodeMachine’s OpenCode engine.**  
- Other OpenCode providers like `opencode/grok-code` work correctly through CodeMachine.

I tried in linux and in windows. Same outcome

<img width="1032" height="786" alt="Image" src="https://github.com/user-attachments/assets/7b565003-f853-4544-97c4-a9b0ed90a2a4" />

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
  modelID: "gpt-5-mini",
},

---
