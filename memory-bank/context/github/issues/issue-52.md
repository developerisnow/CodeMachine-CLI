---
issue_number: 52
title: "Optimal Claude engine config"
state: OPEN
author: hnipps
created_at: 2025-12-06T14:27:12Z
updated_at: 2025-12-11T15:08:42Z
closed_at: N/A
labels: []
comments_count: 1
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/52
backup_date: 2026-01-04T07:37:17Z
---

# #52: Optimal Claude engine config

**State:** OPEN
**Author:** @hnipps
**Created:** 2025-12-06T14:27:12Z
**Updated:** 2025-12-11T15:08:42Z
**Closed:** N/A
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/52

---

## Description

Tried out codemachine for the first time yesterday. I just asked it to integrate a couple of UI components with some API endpoints. It ran for a few hours before hitting session limit on Max plan. 

I'm wondering if there's an optimal way to specify which Claude model is used by each agent and sub-agent?

I don't think I need Opus to do everything and it'd be great to be more efficient in token usage because this was a very simple task. 

Any pointers on which agents and sub-agents in the default workflow could use smaller Claude models?

---

## Comments (1)


### Comment by @moazbuilds

**Date:** 2025-12-11T15:08:42Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/52#issuecomment-3642375870

Hi! Just to clarify, the default model in 0.7.0 is Sonnet (not Opus). I mentioned how to override models and engines here: #57. More details are available in the docs: [Complete override options reference](https://docs.codemachine.co/latest/customizing-workflows/?h=#complete-override-options-reference)

---
