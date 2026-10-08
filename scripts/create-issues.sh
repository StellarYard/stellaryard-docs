#!/usr/bin/env bash
# Creates the planned issue backlog for StellarYard in one run.
#
#   ./scripts/create-issues.sh [owner/repo]
#
# Every issue is created with a commit-style title, type labels, and a body
# carrying Summary / Acceptance Criteria (checkboxes) / Tech Stack, per the
# maintainer playbook. Re-running skips issues whose title already exists.
set -euo pipefail

REPO="${1:-StellarYard/stellaryard-docs}"

create_issue() {
  local title="$1" labels="$2" body="$3"

  if gh issue list --repo "$REPO" --state all --limit 200 \
      --json title --jq '.[].title' | grep -Fxq "$title"; then
    echo "skip (exists): $title"
    return 0
  fi

  gh issue create --repo "$REPO" --title "$title" --label "$labels" --body "$body" >/dev/null
  echo "created: $title"
}

create_issue \
  "docs: add the missing API reference pages for containers and accounts" \
  "documentation,ready,good first issue" \
  "## Summary

The API reference covers the endpoints at a glance but the per-endpoint pages
are thin — containers and accounts pages are under 200 words while the
OpenAPI spec they describe is far larger. A contributor picking up \`POST
/accounts\` currently has to read core's handlers to learn the request shape.

## Why it matters

This is the page a first-time integrator reads before writing a client. If
the request and response shapes are not here, they will guess and get it
wrong — core already had a field-naming bug that a precise reference page
would have caught.

## Acceptance Criteria

- [ ] \`docs/api/containers.md\` documents start, stop, and list: method, path, request body, response shape, status codes
- [ ] \`docs/api/accounts.md\` documents create, list, and get the same way
- [ ] Every example is a real request/response captured from a running core, not invented
- [ ] Field names match \`api/openapi.yaml\` exactly (camelCase)
- [ ] Endpoints that are not implemented are marked as such instead of documented as working
- [ ] \`mkdocs build --strict\` passes

## Tech Stack

MkDocs Material, Markdown, OpenAPI 3.0, Go (for capturing sample responses)"

create_issue \
  "docs: add a troubleshooting page for the docker and port conflicts new users hit" \
  "documentation,ready" \
  "## Summary

Core binds Horizon and Soroban RPC to ports that many other tools also want
(8000 in particular). When a developer already has something on that port the
failure mode is opaque: containers start, health checks fail, and the
dashboard shows \`disconnected from core\` with nothing pointing at the cause.

## Acceptance Criteria

- [ ] A troubleshooting page covering: port already in use, Docker daemon not running, core not running, dashboard disconnected banner, account creation failures
- [ ] Each entry states the exact error a user sees, the command that confirms it, and the fix
- [ ] \`mkdocs build --strict\` passes
- [ ] Page is registered in \`nav\`

## Tech Stack

MkDocs Material, Markdown, Docker, Go"

create_issue \
  "docs: document the environment variables core and the dashboard read" \
  "documentation,ready" \
  "## Summary

Configuration currently exists as flags and defaults scattered across three
repositories. There is no single table of every environment variable, its
default, and which component reads it.

## Acceptance Criteria

- [ ] One table listing every variable: name, read by, default, purpose
- [ ] Covers core (\`--core-url\`, database path, port), dashboard (\`VITE_*\`), and CLI (\`--core-url\`, \`--format\`)
- [ ] Notes which variables are safe to change and which are load-bearing
- [ ] \`mkdocs build --strict\` passes

## Tech Stack

MkDocs Material, Markdown, Go, TypeScript"

create_issue \
  "docs: add real figures to the introduction instead of vague claims" \
  "documentation,critical-path" \
  "## Summary

The introduction says StellarYard removes friction but cites no numbers. The
maintainer playbook requires real cited figures over vague claims, and a
grant reviewer reads this page first.

## Acceptance Criteria

- [ ] States a measured setup-time comparison (manual Docker + CLI vs StellarYard) with the actual commands and timing
- [ ] Any ecosystem figure carries a link to its source and the date it was checked
- [ ] No unverified numbers — remove or source anything that cannot be backed
- [ ] \`mkdocs build --strict\` passes

## Tech Stack

MkDocs Material, Markdown"

create_issue \
  "docs: add a developer guide with SDK-style code examples for every CLI command" \
  "documentation,ready" \
  "## Summary

The developer guide explains local setup but does not show the CLI used in a
real workflow. Each command should appear in a runnable sequence, not as an
isolated snippet.

## Acceptance Criteria

- [ ] One end-to-end walkthrough: start core, start containers, create an account, deploy, invoke, read the ledger
- [ ] Every command block is copy-pasteable and was actually run
- [ ] Expected output is shown next to each command
- [ ] Commands that are not yet implemented say so instead of showing fake output
- [ ] \`mkdocs build --strict\` passes

## Tech Stack

MkDocs Material, Markdown, Go"

create_issue \
  "docs: wire link checking into CI so broken references fail the build" \
  "testing,documentation" \
  "## Summary

Strict mode validates that nav entries resolve, but a link to a renamed file
or an external URL that 404s still ships. Broken links are the most common
documentation defect and are invisible until a reader clicks them.

## Acceptance Criteria

- [ ] CI fails on internal links that do not resolve
- [ ] External links are checked on a schedule rather than blocking every PR (they are flaky)
- [ ] Current docs pass with zero broken internal links
- [ ] The check runs in the existing \`Deploy Docs\` workflow

## Tech Stack

MkDocs Material, Python, GitHub Actions"

echo
echo "Done. Open issues in $REPO:"
gh issue list --repo "$REPO" --state open --limit 50
