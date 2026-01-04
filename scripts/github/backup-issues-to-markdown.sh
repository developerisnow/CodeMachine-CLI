#!/bin/bash

# GitHub Issues Backup to Markdown
# Usage: ./backup-issues-to-markdown.sh [owner/repo] [output_dir]
# Example: ./backup-issues-to-markdown.sh moazbuilds/CodeMachine-CLI ./memory-bank/context/github/issues

set -euo pipefail

# Configuration
REPO="${1:-moazbuilds/CodeMachine-CLI}"
OUTPUT_DIR="${2:-./memory-bank/context/github/issues}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Parse repo owner and name
IFS='/' read -r OWNER REPO_NAME <<< "$REPO"

echo "📝 GitHub Issues Backup to Markdown"
echo "===================================="
echo "Repository: $REPO"
echo "Output dir: $OUTPUT_DIR"
echo ""

# Create directory structure
mkdir -p "$OUTPUT_DIR"

# Check dependencies
command -v gh >/dev/null 2>&1 || { echo "❌ Error: gh CLI required. Install: brew install gh"; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "❌ Error: jq required. Install: brew install jq"; exit 1; }

# Check gh authentication
if ! gh auth status >/dev/null 2>&1; then
    echo "❌ Error: Not authenticated. Run: gh auth login"
    exit 1
fi

# Temporary JSON file
TEMP_JSON=$(mktemp)
trap "rm -f $TEMP_JSON" EXIT

echo "⏳ Fetching issues with comments via GraphQL..."

# Fetch all issues with comments using GraphQL
gh api graphql --paginate -f query='
query($owner: String!, $name: String!, $endCursor: String) {
  repository(owner: $owner, name: $name) {
    issues(first: 100, after: $endCursor, orderBy: {field: CREATED_AT, direction: DESC}) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        number
        title
        body
        state
        author {
          login
        }
        createdAt
        updatedAt
        closedAt
        url
        labels(first: 10) {
          nodes {
            name
          }
        }
        comments(first: 100) {
          totalCount
          nodes {
            body
            author {
              login
            }
            createdAt
            url
          }
        }
      }
    }
  }
}' -f owner="$OWNER" -f name="$REPO_NAME" > "$TEMP_JSON"

echo "✅ Issues fetched"

# Count issues
ISSUE_COUNT=$(jq '[.data.repository.issues.nodes[]] | length' "$TEMP_JSON")
echo "📊 Found $ISSUE_COUNT issues"

# Process each issue into markdown
echo "⏳ Converting to Markdown..."

jq -r '.data.repository.issues.nodes[] | @json' "$TEMP_JSON" | while read -r issue_json; do
    number=$(echo "$issue_json" | jq -r '.number')
    title=$(echo "$issue_json" | jq -r '.title')
    body=$(echo "$issue_json" | jq -r '.body // "No description"')
    state=$(echo "$issue_json" | jq -r '.state')
    author=$(echo "$issue_json" | jq -r '.author.login // "unknown"')
    created_at=$(echo "$issue_json" | jq -r '.createdAt')
    updated_at=$(echo "$issue_json" | jq -r '.updatedAt')
    closed_at=$(echo "$issue_json" | jq -r '.closedAt // "N/A"')
    url=$(echo "$issue_json" | jq -r '.url')
    labels=$(echo "$issue_json" | jq -r '[.labels.nodes[].name] | join(", ")')
    comments_count=$(echo "$issue_json" | jq -r '.comments.totalCount')

    # Create markdown file for this issue
    ISSUE_FILE="$OUTPUT_DIR/issue-${number}.md"

    cat > "$ISSUE_FILE" << EOF
---
issue_number: ${number}
title: "${title//\"/\\\"}"
state: ${state}
author: ${author}
created_at: ${created_at}
updated_at: ${updated_at}
closed_at: ${closed_at}
labels: [${labels}]
comments_count: ${comments_count}
url: ${url}
backup_date: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
---

# #${number}: ${title}

**State:** ${state}
**Author:** @${author}
**Created:** ${created_at}
**Updated:** ${updated_at}
**Closed:** ${closed_at}
**Labels:** ${labels:-none}
**URL:** ${url}

---

## Description

${body}

---

## Comments (${comments_count})

EOF

    # Add comments
    echo "$issue_json" | jq -r '.comments.nodes[] | @json' | while read -r comment_json; do
        c_body=$(echo "$comment_json" | jq -r '.body // ""')
        c_author=$(echo "$comment_json" | jq -r '.author.login // "unknown"')
        c_created=$(echo "$comment_json" | jq -r '.createdAt')
        c_url=$(echo "$comment_json" | jq -r '.url')

        cat >> "$ISSUE_FILE" << EOF

### Comment by @${c_author}

**Date:** ${c_created}
**URL:** ${c_url}

${c_body}

---
EOF
    done

    echo "  ✅ issue-${number}.md"
done

# Create index file
echo "⏳ Creating index..."

INDEX_FILE="$OUTPUT_DIR/_index.md"
cat > "$INDEX_FILE" << EOF
---
repository: ${REPO}
backup_date: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
total_issues: ${ISSUE_COUNT}
---

# GitHub Issues Backup: ${REPO}

**Backup Date:** $(date)
**Total Issues:** ${ISSUE_COUNT}

## Issues by State

### Open Issues

EOF

# Add open issues to index
jq -r '.data.repository.issues.nodes[] | select(.state == "OPEN") | "- [#\(.number)](./issue-\(.number).md) - \(.title) (@\(.author.login // "unknown"))"' "$TEMP_JSON" >> "$INDEX_FILE"

cat >> "$INDEX_FILE" << EOF

### Closed Issues

EOF

# Add closed issues to index
jq -r '.data.repository.issues.nodes[] | select(.state == "CLOSED") | "- [#\(.number)](./issue-\(.number).md) - \(.title) (@\(.author.login // "unknown"))"' "$TEMP_JSON" >> "$INDEX_FILE"

echo ""
echo "🎉 Backup complete!"
echo "📁 Location: $OUTPUT_DIR"
echo "📊 Issues: $ISSUE_COUNT"
echo ""
echo "Files created:"
ls -la "$OUTPUT_DIR" | head -20
