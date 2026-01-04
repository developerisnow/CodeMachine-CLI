---
issue_number: 50
title: "2000 lines of code in 5 hours with more than 2M tokens ~160 USD on Claude Code"
state: OPEN
author: sicing
created_at: 2025-12-05T14:30:51Z
updated_at: 2025-12-11T16:05:29Z
closed_at: N/A
labels: [question]
comments_count: 2
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/50
backup_date: 2026-01-04T07:37:17Z
---

# #50: 2000 lines of code in 5 hours with more than 2M tokens ~160 USD on Claude Code

**State:** OPEN
**Author:** @sicing
**Created:** 2025-12-05T14:30:51Z
**Updated:** 2025-12-11T16:05:29Z
**Closed:** N/A
**Labels:** question
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/50

---

## Description

My first experience with CM wasn't a great one. It spent 6 hours writing a small web dashboard with 2,000 lines of code. There were 30 tasks and 300 agents created. 
I produced the spec with Claude and reviewed it afterwards. It didn't overengineer and didn't misunderstand the spec. So what could've gone wrong?

---

## Comments (2)


### Comment by @moazbuilds

**Date:** 2025-12-11T15:14:00Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/50#issuecomment-3642398554

Hi! The default workflow in 0.7.0 is definitely overkill for small projects, it's designed for projects with 4,500+ lines of code, where it creates complex tasks. 

Also Claude tends to generate very verbose plans by default. I recommend using Codex for the planning phase.

We'll add a new, workflow in 0.8.0 that's better suited for projects like yours.

---

### Comment by @sicing

**Date:** 2025-12-11T16:05:29Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/50#issuecomment-3642635405

Thanks, that makes sense

---
