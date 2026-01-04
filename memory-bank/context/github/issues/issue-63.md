---
issue_number: 63
title: "Cursor engine uses OpenCode instead of cursor-agent CLI - no way to use Gemini models"
state: OPEN
author: adhirajchhoda
created_at: 2025-12-25T11:08:11Z
updated_at: 2025-12-25T11:08:11Z
closed_at: N/A
labels: []
comments_count: 0
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/63
backup_date: 2026-01-04T07:37:15Z
---

# #63: Cursor engine uses OpenCode instead of cursor-agent CLI - no way to use Gemini models

**State:** OPEN
**Author:** @adhirajchhoda
**Created:** 2025-12-25T11:08:11Z
**Updated:** 2025-12-25T11:08:11Z
**Closed:** N/A
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/63

---

## Description

From what I've investigated, it seems cursor engine in codemachine uses opencode internally instead of the actual cursor cli. As a result, models such as gemini-3-pro are unavailable because OpenCode only supports its own model set (for example, opencode/gpt-5-nano and opencode/big-pickle). The .codemachinerc configuration option "command": "cursor-agent" is ignored, and there is no way to pass cursor-agent–specific flags like --model gemini-3-pro to control model selection.

Expected behavior: The cursor engine should invoke the cursor-agent CLI directly so that models like gemini-3-pro, and other cursor-supported models can be selected and used normally.

Current behavior: Attempting to use a Gemini model results in a ProviderModelNotFoundError, with data showing { providerID: "gemini-3-pro", modelID: "" }, indicating that the provider is not recognized by the underlying OpenCode engine.

Feature request: Either add a separate engine (for example, a cursor-agent engine) that shells out to the cursor-agent CLI, or allow users to configure which CLI binary the cursor engine uses so cursor-agent can be selected instead of OpenCode.

Environment: CodeMachine v0.7.0

---

## Comments (0)

