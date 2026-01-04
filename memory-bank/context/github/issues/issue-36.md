---
issue_number: 36
title: "Bug Report: Crashes on /start with \\"Memory entry requires non-empty content\\" during Agent 7 (init)"
state: OPEN
author: robinr2
created_at: 2025-11-27T11:04:57Z
updated_at: 2025-11-28T12:40:38Z
closed_at: N/A
labels: [bug]
comments_count: 0
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/36
backup_date: 2026-01-04T07:37:18Z
---

# #36: Bug Report: Crashes on /start with "Memory entry requires non-empty content" during Agent 7 (init)

**State:** OPEN
**Author:** @robinr2
**Created:** 2025-11-27T11:04:57Z
**Updated:** 2025-11-28T12:40:38Z
**Closed:** N/A
**Labels:** bug
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/36

---

## Description

When running codemachine /start with user specifications added to inputs/specifications.md, the workflow consistently crashes during Agent 7 (init) with the following error:

<img width="1916" height="689" alt="Image" src="https://github.com/user-attachments/assets/21b2a208-00e8-47a7-9ec8-75afdbcff6e0" />
Agent 7 (init) failed after 462ms: Memory entry requires non-empty content
Workflow execution failed

My spec file contains:

```
# Project Specifications

Overall Architecture

Frontend built with React.

Backend built with Express.js.

Real-time or turn-based multiplayer functionality (e.g., via WebSockets or REST polling).

Clean project structure for both client and server.

Frontend Requirements (React)

A polished, modern UI for the Tic Tac Toe board.

Show player names, current turn, and game status (win/lose/draw).

Prevent invalid moves.

Smooth user experience with clear interactions.

Backend Requirements (Express)

Manages game state for two connected players.

Endpoints or WebSocket logic to:

Create/join a game.

Sync moves between players.

Determine game results.
```


**Not sure if related:**
I have logged in using opencode, which then tells me:  "OpenCode is already authenticated. Use /logout to sign out. " 
If I logout and in again, the same message appears.

**Environment**
CodeMachine CLI Version: v0.7.0
Operating System: Ubuntu 24.04.3 LTS
Node.js Version: v21.4.0

---

## Comments (0)

