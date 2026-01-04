---
issue_number: 22
title: "Unclear how to make Custom Workflows"
state: OPEN
author: GoodFarming
created_at: 2025-11-07T10:44:06Z
updated_at: 2025-11-25T22:24:45Z
closed_at: N/A
labels: [documentation]
comments_count: 5
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/22
backup_date: 2026-01-04T07:37:19Z
---

# #22: Unclear how to make Custom Workflows

**State:** OPEN
**Author:** @GoodFarming
**Created:** 2025-11-07T10:44:06Z
**Updated:** 2025-11-25T22:24:45Z
**Closed:** N/A
**Labels:** documentation
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/22

---

## Description

I hit the free-tier limit for cursor, so I was going to change the commit agent to Claude to keep things moving.

It made me realize I have no idea how to customize workflows, I hit a wall with it.

I guess I need to force edit the global install?

I tried several folder locations for project-specific workflows. 

--

it appears while i was messing around with this codemachine has lost its place, 5hrs of progress but now it tries to reintialise.

it looks like because the last commit failed, it doesnt know where it is anymore. 

---

## Comments (5)


### Comment by @GoodFarming

**Date:** 2025-11-07T10:47:26Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/22#issuecomment-3501832651

ok, I have figured out how to resume, by skipping ahead to the commit agent, and letting the process take over from there.

more clarity on how to save/update custom workflows I think would be really beneficial anyway.

---

### Comment by @moazbuilds

**Date:** 2025-11-07T11:41:47Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/22#issuecomment-3502079027

**Simple Solution:** If you want to completely stop using Cursor, simply log out of Cursor and the system will automatically fallback to other available engines. This is the most straightforward approach.

**Advanced Solution:**

To customize the workflow, you'll need to clone the repository to your local system. Here's how:

1. First, uninstall the global CodeMachine installation:
   ```
   npm uninstall -g codemachine
   ```

2. After cloning the repository, run the following commands:
   ```
   npm install
   npm run build
   npm link
   ```
   Note: The `npm link` command makes CodeMachine available globally on your system, you can run it using `codemachine` as normal. 

3. Navigate to the `templates/workflow` folder where you'll find `codemachine.workflow.js` - this is the main configuration file for overriding engines and models.

4. The workflow configuration will look like this:
   ```javascript
   steps: [
     resolveStep('arch-agent', { engine: 'claude', model: 'opus' }),
     resolveStep('code-generation', { engine: 'codex', model: 'gpt-5-codex' }),
     resolveStep('task-sanity-check', { engine: 'codex', model: 'gpt-5' }),
     resolveStep('git-commit', { engine: 'cursor' })
   ]
   ```

5. You can modify the `engine` and `model` parameters as needed.

---

### Comment by @moazbuilds

**Date:** 2025-11-07T11:43:44Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/22#issuecomment-3502087195

We're planning to introduce a template builder that will make it much easier to customize models and engines through CLI. This feature is expected to be available in a future release.

---

### Comment by @harms-haus

**Date:** 2025-11-11T15:27:16Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/22#issuecomment-3517449686

Came here to make the same issue. +1 

I'd like to add that it'd be great even if it just *also* looked in a workspace folder like `./.codemachine/templates/workflows` or something like that.

---

### Comment by @Joe-121

**Date:** 2025-11-25T22:24:45Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/22#issuecomment-3577842108

"Navigate to the templates/workflow folder where you'll find codemachine.workflow.js - this is the main configuration file for overriding engines and models."

I installed with BUN using codemachine 0.70. There is no templates folder on start up and yet the /templates command shows that the default template is still available to run. Where is it looking for templates?

---
