---
issue_number: 2
title: "Referenced docs not available because they're .gitignored"
state: CLOSED
author: ebrindley
created_at: 2025-10-09T12:09:12Z
updated_at: 2025-10-18T23:19:27Z
closed_at: 2025-10-18T23:19:27Z
labels: []
comments_count: 2
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/2
backup_date: 2026-01-04T07:37:20Z
---

# #2: Referenced docs not available because they're .gitignored

**State:** CLOSED
**Author:** @ebrindley
**Created:** 2025-10-09T12:09:12Z
**Updated:** 2025-10-18T23:19:27Z
**Closed:** 2025-10-18T23:19:27Z
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/2

---

## Description

**README references**
#Deep dives: [docs/CLI-ENGINES.md](https://github.com/moazbuilds/CodeMachine-CLI/blob/main/docs/CLI-ENGINES.md), [docs/operations](https://github.com/moazbuilds/CodeMachine-CLI/blob/main/docs/operations), and [docs/architecture](https://github.com/moazbuilds/CodeMachine-CLI/blob/main/docs/architecture)

but they're not available because

**.gitignore**
1. node_modules/
2. dist/
3. coverage/
4. .DS_Store
5. reports/
**6. docs/***
7. 
8. # Ignore specific dotfiles/folders
9. .codemachine
10. .env
11. .env.example
12. .npmrc
13. 
14. # Ignore folders starting with .tmp
15. .tmp*

---

## Comments (2)


### Comment by @moazbuilds

**Date:** 2025-10-09T13:22:08Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/2#issuecomment-3385853008

I’ve taken the documents down for a quick update, they’ll be back soon!

---

### Comment by @moazbuilds

**Date:** 2025-10-18T23:19:27Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/2#issuecomment-3419056327

Docs added

---
