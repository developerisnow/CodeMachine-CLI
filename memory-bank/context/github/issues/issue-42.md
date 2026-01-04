---
issue_number: 42
title: "How to tweak workflow and resume codemachine ?"
state: OPEN
author: NickCullen
created_at: 2025-11-30T18:28:26Z
updated_at: 2025-12-04T00:14:33Z
closed_at: N/A
labels: [enhancement, question]
comments_count: 3
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/42
backup_date: 2026-01-04T07:37:17Z
---

# #42: How to tweak workflow and resume codemachine ?

**State:** OPEN
**Author:** @NickCullen
**Created:** 2025-11-30T18:28:26Z
**Updated:** 2025-12-04T00:14:33Z
**Closed:** N/A
**Labels:** enhancement, question
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/42

---

## Description

Hey,

Amazing tool, I've been trying it out this weekend and have had way more fun than I should have tweaking and playing around with a custom workflow! 

I do have some pain points though..

1. Everytime I update my workflow, when I run /start in codemachine it starts again at the init stage and tries to re-plan over the already existing plan. 
2. The way I understand how we add agents, is that we need to place them in the node binary directory where codemachine lives? I struggled getting it to work by placing files in my project's .codemachine/ directory. 

Also, is this at all possible to add? 
1. The ability to interrupt / queue a message to send to the running agent. 
2. How do we add a new spec (feature) to the project once it's deemed 'complete'?

---

## Comments (3)


### Comment by @Emerson

**Date:** 2025-12-01T17:00:11Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/42#issuecomment-3597750105

Also very impressed and have generated a mid-level complexity project. There are some issues that I need to fix as the generated project has a number of bugs/problems and I don't see any workflows related to this.

I think it would be amazing to add functionality that allows users to add new features, refinements, and address bugs.

---

### Comment by @moazbuilds

**Date:** 2025-12-02T11:06:30Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/42#issuecomment-3601470857

Thank you so much, we’re really glad you’re enjoying it!

Let me address your questions:

**Re-planning on /start:** CodeMachine indexes your workflow progress in `template.json`, translating each template step into an index number starting from 0. So it shouldn’t restart from the beginning unless this file gets deleted, or agents arrangement got changed. You can manually edit this file to adjust your current position in the workflow if needed.

**Agent file locations:** We’re aware this is a pain point! In the next release, you’ll be able to place agents and override models in `~/.codemachine/resources`, which should make them much easier to manage and modify.

**Interrupting or queuing messages:** You can achieve this by stopping the workflow and using the `codemachine step` command. This lets you send custom prompts to an agent and fine tune your experience. Check out the `step` command details in our [CLI reference docs](http://docs.codemachine.co/latest/cli-reference/). It should help, at least in this early stage.

**Adding new features after completion:** The best approach is to manually add tasks to the `.codemachine/tasks` folder in your JSON files. You can use any AI agent manually to help break down new features into task format, or add new iterations. If the bot is showing as “completed,” deleting `memory/behavior.json` will reset that status.

Hope this helps. Let us know if you run into anything else!

---

### Comment by @rothnic

**Date:** 2025-12-04T00:14:33Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/42#issuecomment-3609362480

> Agent file locations: We’re aware this is a pain point! In the next release, you’ll be able to place agents and override models in ~/.codemachine/resources, which should make them much easier to manage and modify.

@moazbuilds would love to get all overrides/customizations into the ./.codemachine directory. I think this is a pretty common pattern and is consistent with how opencode handles it. The docs were a bit confusing about folder references, etc, so leveraging a more common pattern would be great. If we decide to stop using codemachine it would be easier to extract it all and more clear what the other files are associated with (./config).

I've been slowly working on an orchestration layer like this for opencode, so glad to have come across this project. Some concepts i was working on might be useful in this project, so I may look at creating some PRs soon. 

---
