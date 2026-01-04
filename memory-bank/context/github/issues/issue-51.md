---
issue_number: 51
title: "Does CodeMachine provide a non-interactive way to script agent runs?"
state: OPEN
author: FarrukhCyber
created_at: 2025-12-05T16:49:35Z
updated_at: 2025-12-05T18:58:05Z
closed_at: N/A
labels: []
comments_count: 2
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/51
backup_date: 2026-01-04T07:37:17Z
---

# #51: Does CodeMachine provide a non-interactive way to script agent runs?

**State:** OPEN
**Author:** @FarrukhCyber
**Created:** 2025-12-05T16:49:35Z
**Updated:** 2025-12-05T18:58:05Z
**Closed:** N/A
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/51

---

## Description

Hi,
I'm working on a project that involves refactoring large applications from one programming language to another. The workflow requires sending a sequence of prompts each directing the agent to refactor a specific module or function, so the process needs to be fully automated.

Given the scale of the application, interactive CLI usage isn't feasible. I need a way to orchestrate CodeMachine agents programmatically (e.g., from a Python script that generates prompts dynamically).

From the documentation, it appears that CodeMachine only supports interactive CLI usage.
Is there currently any non-interactive or scriptable interface for CodeMachine, or plans to add one?

Thanks!

---

## Comments (2)


### Comment by @moazbuilds

**Date:** 2025-12-05T18:24:03Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/51#issuecomment-3618023569

Hi, 

Your use case for automated large-scale refactoring is exactly the kind of workflow we're prioritizing in our roadmap.

We're currently working on a major architectural refactoring in version 0.8.0 that will introduce an event bus as a middle layer between the backend and our new TUI. This architecture will enable headless log streaming adapters specifically designed for your use case, as well as for running CodeMachine on VPS or server environments. This release is coming very soon and will allow users to test long-running workflows that might take days to complete, which is essential before we fully implement parallel execution with git worktrees and trunk-based development for isolated branch operations.

In the meantime, there's an existing feature you can leverage: CodeMachine's orchestrator agent can dynamically generate and execute hundreds of subagent prompts within the system itself. This means you can use CodeMachine to programmatically create the prompts for your refactoring workflow and automate the entire process internally.

Your language migration workflow aligns well with where we're heading with CodeMachine, and we've been hearing similar requests from the community. We're actively building out the infrastructure to support these kinds of workflows and would be glad to help you navigate the current capabilities while the headless features are in development.

If you'd like to discuss your specific setup or explore what's possible with the current orchestrator approach, feel free to reach out on Discord at moazbuilds.

---

### Comment by @FarrukhCyber

**Date:** 2025-12-05T18:58:05Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/51#issuecomment-3618155630

Thanks @moazbuilds! Excited to see what the new release will offer.

---
