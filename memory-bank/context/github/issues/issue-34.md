---
issue_number: 34
title: "The Claude Code API has already been configured in the system environment, so why do I still need to log in to Claude?"
state: CLOSED
author: gzsklsskszngc
created_at: 2025-11-20T05:47:21Z
updated_at: 2025-11-20T12:12:59Z
closed_at: 2025-11-20T12:12:47Z
labels: [question]
comments_count: 1
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/34
backup_date: 2026-01-04T07:37:18Z
---

# #34: The Claude Code API has already been configured in the system environment, so why do I still need to log in to Claude?

**State:** CLOSED
**Author:** @gzsklsskszngc
**Created:** 2025-11-20T05:47:21Z
**Updated:** 2025-11-20T12:12:59Z
**Closed:** 2025-11-20T12:12:47Z
**Labels:** question
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/34

---

## Description

This is clearly unreasonable

---

## Comments (1)


### Comment by @moazbuilds

**Date:** 2025-11-20T12:12:46Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/34#issuecomment-3557702329

Codemachine isolates each engine from your normal environment so you can fully control its config and logins without affecting your regular setup. We also override the default credential home paths to live under .codemachine/{{engineID}} inside your local machine, which lets us fully manage input/output manage logins in a contained way.

None of this data is saved or uploaded to our servers, and we don’t monitor your usage. The option to override the API via the terminal will use Codemachine’s custom environments. That part isn’t fully wired up yet, but it’s already on our roadmap.

---
