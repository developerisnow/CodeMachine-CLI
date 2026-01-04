---
issue_number: 3
title: "Claude setup-token failed to create credentials"
state: CLOSED
author: shintaii
created_at: 2025-10-09T12:36:08Z
updated_at: 2025-10-09T18:24:18Z
closed_at: 2025-10-09T18:24:18Z
labels: []
comments_count: 5
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/3
backup_date: 2026-01-04T07:37:20Z
---

# #3: Claude setup-token failed to create credentials

**State:** CLOSED
**Author:** @shintaii
**Created:** 2025-10-09T12:36:08Z
**Updated:** 2025-10-09T18:24:18Z
**Closed:** 2025-10-09T18:24:18Z
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/3

---

## Description

Long-lived authentication token created successfully!

Your OAuth token (valid for 1 year):

########
Store this token securely. You won't be able to see it again.

Use this token by setting: export CLAUDE_CODE_OAUTH_TOKEN=<token>


Error: Claude setup-token failed to create credentials
    at ensureAuth (file:///Users/me/.nvm/versions/node/v22.14.0/lib/node_modules/codemachine/dist/index.js:1448:11)
    at async runStartupFlow (file:///Users/me/.nvm/versions/node/v22.14.0/lib/node_modules/codemachine/dist/index.js:2592:9)
    at async Command.<anonymous> (file:///Users/me/.nvm/versions/node/v22.14.0/lib/node_modules/codemachine/dist/index.js:3211:35)
    at async Command.parseAsync (/Users/me/.nvm/versions/node/v22.14.0/lib/node_modules/codemachine/node_modules/commander/lib/command.js:1092:5)
    at async runCodemachineCli (file:///Users/me/.nvm/versions/node/v22.14.0/lib/node_modules/codemachine/dist/index.js:3395:3)

---

## Comments (5)


### Comment by @moazbuilds

**Date:** 2025-10-09T13:16:56Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/3#issuecomment-3385833256

Could you please explain your operating system and the CLI you’re using?

---

### Comment by @moazbuilds

**Date:** 2025-10-09T13:26:45Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/3#issuecomment-3385882356

I also modified your post to remove the OAuth token it's a sensitive token can't be shared 

---

### Comment by @shintaii

**Date:** 2025-10-09T18:20:28Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/3#issuecomment-3387029375

> I also modified your post to remove the OAuth token it's a sensitive token can't be shared

I changed to all XXXXX so that would have been fine. 

---

### Comment by @shintaii

**Date:** 2025-10-09T18:20:56Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/3#issuecomment-3387030815

> Could you please explain your operating system and the CLI you’re using?

MacOS with ZSH terminal. 

---

### Comment by @moazbuilds

**Date:** 2025-10-09T18:24:18Z
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/3#issuecomment-3387042061

 This error originates from the Claude code, it occurs when the system can’t create a credentials file. It’s normal on some systems.

 You can resolve it by using the `CLAUDE_CODE_OAUTH_TOKEN` environment variable, which was added in the **0.2.1 release**.

To update, run:

```

npm install -g codemachine@latest
codemachine --version
```

---
