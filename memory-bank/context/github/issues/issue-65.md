---
issue_number: 65
title: "Use Code Machine with Claude Code powered by z.ai's GLM 4.7 model"
state: OPEN
author: Gorby200
created_at: 2026-01-01T21:13:08Z
updated_at: 2026-01-01T21:13:08Z
closed_at: N/A
labels: []
comments_count: 0
url: https://github.com/moazbuilds/CodeMachine-CLI/issues/65
backup_date: 2026-01-04T07:37:15Z
---

# #65: Use Code Machine with Claude Code powered by z.ai's GLM 4.7 model

**State:** OPEN
**Author:** @Gorby200
**Created:** 2026-01-01T21:13:08Z
**Updated:** 2026-01-01T21:13:08Z
**Closed:** N/A
**Labels:** none
**URL:** https://github.com/moazbuilds/CodeMachine-CLI/issues/65

---

## Description

I use Claude Code with z.ai GML 4.7 model. No OAuth authorization, but configured environment variables
`{
    "env": {
        "ANTHROPIC_AUTH_TOKEN": "your_zai_api_key",
        "ANTHROPIC_BASE_URL": "https://api.z.ai/api/anthropic",
        "API_TIMEOUT_MS": "3000000"
    }
}`

 and z.ai MCP server in .claude.json:

` "zai-mcp-server": {
   "type": "stdio",
   "command": "npx.cmd",
   "args": [
     "-y",
     "@z_ai/mcp-server"
   ],
   "env": {
     "Z_AI_MODE": "ZAI",
     "Z_AI_API_KEY": "*************************************************"
   }`

Documentation: https://docs.z.ai/devpack/tool/claude

Perhaps there's a way to use Claude code w/o mandatory OAuth? Or just use the same MCP Server? Z.ai is quite popular for coding these days.

---

## Comments (0)

