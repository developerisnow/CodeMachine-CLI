---
issue_number: 9
title: "Is there any plan to support Claude Code usage without having to authenticate to Anthropic?"
state: CLOSED
author: apraditya
created_at: 2025-10-22T09:52:21Z
updated_at: 2025-10-24T12:20:38Z
closed_at: 2025-10-24T12:20:38Z
labels: []
comments_count: 1
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/9
backup_date: 2026-01-04T07:37:20Z
---

# #9: Is there any plan to support Claude Code usage without having to authenticate to Anthropic?

**State:** CLOSED
**Author:** @apraditya
**Created:** 2025-10-22T09:52:21Z
**Updated:** 2025-10-24T12:20:38Z
**Closed:** 2025-10-24T12:20:38Z
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/9

---

## Description

There are ways to use Claude Code with models that aren't provided by Anthropic like using [claude-code-router](https://github.com/musistudio/claude-code-router) or overriding `ANTHROPIC_*` environment variables as described on [moonshot docs](https://platform.moonshot.ai/docs/guide/agent-support#configure-environment-variables), GLM, etc. Is there a way to utilize Claude Code without authentication? Is there any plan to support it?

Appreciate your help.

---

## Comments (1)


### Comment by @moazbuilds

**Date:** 2025-10-22T20:51:38Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/9#issuecomment-3434165163

Currently, the only way to achieve this is by editing your own fork. The environment variable is located in src/infra/engines/providers/{{engineName}}/execution/runner.ts at line 87. You can ask Claude to add this override for you.

We do plan to support this officially, but it will likely come after two to three version updates. There’s a major update coming in the next few days, and after that, we may introduce an easier way to define overrides for each agent Insha'Allah.

---
