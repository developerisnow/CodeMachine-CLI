---
issue_number: 53
title: "Suboptimal pre-installation security audit results with npq"
state: CLOSED
author: exigentix-dev
created_at: 2025-12-07T02:54:07Z
updated_at: 2025-12-11T15:04:25Z
closed_at: 2025-12-11T15:03:28Z
labels: [enhancement]
comments_count: 1
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/53
backup_date: 2026-01-04T07:37:16Z
---

# #53: Suboptimal pre-installation security audit results with npq

**State:** CLOSED
**Author:** @exigentix-dev
**Created:** 2025-12-07T02:54:07Z
**Updated:** 2025-12-11T15:04:25Z
**Closed:** 2025-12-11T15:03:28Z
**Labels:** enhancement
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/53

---

## Description

I use the [npq](https://github.com/lirantal/npq) package to perform pre-install security checks on all 3rd-party packages. 

I'm super interested in trying out codemachine, but unfortunately it's triggered a number of warnings:

<img width="969" height="421" alt="Image" src="https://github.com/user-attachments/assets/62ad6fe3-e73f-465f-8d45-f4592ce7d836" />

I'm sure you're super busy with bugfixes and feature requests, but I'm just wondering if there's any chance you might be motivated to improve the security posture of your npm package a bit.

I'm willing to ignore:
- This version was published only 14 days ago...
- Detected a relatively low download-count package...

...but the rest of them are somewhat significant.

---

## Comments (1)


### Comment by @moazbuilds

**Date:** 2025-12-11T15:03:28Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/53#issuecomment-3642353057

Thanks for reporting this; it will be improved in the next release (0.8.0).

---
