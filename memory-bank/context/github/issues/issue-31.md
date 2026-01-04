---
issue_number: 31
title: "Providers other than OpenCode are currently not functioning within the OpenCode engine."
state: CLOSED
author: LegendEvent
created_at: 2025-11-18T10:36:51Z
updated_at: 2025-11-18T10:50:35Z
closed_at: 2025-11-18T10:50:35Z
labels: []
comments_count: 0
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/31
backup_date: 2026-01-04T07:37:18Z
---

# #31: Providers other than OpenCode are currently not functioning within the OpenCode engine.

**State:** CLOSED
**Author:** @LegendEvent
**Created:** 2025-11-18T10:36:51Z
**Updated:** 2025-11-18T10:50:35Z
**Closed:** 2025-11-18T10:50:35Z
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/31

---

## Description

This issue is related to this response in: 
> Hi, after adding OpenCode and CCR, we do have additional engines on our roadmap, but they’re not scheduled in the near term. In the meantime, we’re open to community contributions for new engines. You can review the existing PRs, contributors have been actively adding engines, and we’ve created a simple Notion guide to help contributors implement their own. When reviewing past PRs and the subsequent improvements, you’ll see common pitfalls, mostly related to overriding the home directory, authentication, and logging.
> 
> https://www.notion.so/1ed66323847280aa96c1ee5295053ad4
> 
> ### Additional context: OpenCode engine + GitHub Copilot provider fails with `ProviderModelNotFoundError`
> 
> I’ve been testing CodeMachine’s **OpenCode engine** with **GitHub Copilot** as an LLM provider, and I’m hitting a consistent failure that feels closely related to this request for GitHub Copilot CLI support.
> 
> Short version:  
> 
> - **OpenCode + GitHub Copilot works fine when called directly.**  
> - **The same provider/models fail with `ProviderModelNotFoundError` when invoked via CodeMachine’s OpenCode engine.**  
> - Other OpenCode providers like `opencode/grok-code` work correctly through CodeMachine.
> 
> I tried in linux and in windows. Same outcome
> 
> <img width="1032" height="786" alt="Image" src="https://github.com/user-attachments/assets/7b565003-f853-4544-97c4-a9b0ed90a2a4" />
> 
> 545 |       providerID,
> 546 |       modelID,
> 547 |     })
> 548 |
> 549 |     const provider = s.providers[providerID]
> 550 |     if (!provider) throw new ModelNotFoundError({ providerID, modelID })
>                                ^
> ProviderModelNotFoundError: ProviderModelNotFoundError
>  data: {
>   providerID: "github-copilot",
>   modelID: "gpt-5-mini",
> },
>  

 _Originally posted by @LegendEvent in [#24](https://github.com/moazbuilds/CodeMachine-CLI/issues/24#issuecomment-3544279602)_

and 

> workstation@workstation:~/IdeaProjects/prohibiton-client$ codemachine step arch-agent --engine opencode --model github-copilot/gpt-5-codex
> ════════════════════════════════════════════════════════════════════════════════
> Architecture Agent started to work.
> 520 |       providerID,
> 521 |       modelID,
> 522 |     })
> 523 | 
> 524 |     const provider = s.providers[providerID]
> 525 |     if (!provider) throw new ModelNotFoundError({ providerID, modelID })
>                                ^
> ProviderModelNotFoundError: ProviderModelNotFoundError
>  data: {
>   providerID: "github-copilot",
>   modelID: "gpt-5-codex",
> },
> 
>       at getModel (src/provider/provider.ts:525:26)
>  

 _Originally posted by @oldschoola in [#24](https://github.com/moazbuilds/CodeMachine-CLI/issues/24#issuecomment-3521286994)_


This bug affects the execution of any authentication provider within OpenCode, as all providers were incorrectly treated as plugins. It was not specific to GitHub Copilot. As a result, users were unable to use any authentication method other than the default, when using opencode engine.

---

## Comments (0)

