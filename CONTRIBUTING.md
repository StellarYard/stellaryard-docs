# Contributing to StellarYard Docs

Thank you for your interest in improving StellarYard's documentation. This repo is the published doc site for the whole project.

## Code of Conduct

Be respectful, constructive, and professional. We're building tools for the Stellar ecosystem together.

## Prerequisites

- Python 3.10+
- Git

## Setup

```bash
git clone https://github.com/StellarYard/stellaryard-docs.git
cd stellaryard-docs

python -m venv .venv
source .venv/bin/activate

pip install mkdocs mkdocs-material
```

## Working Locally

```bash
# Live-reload preview at http://127.0.0.1:8000
mkdocs serve

# Production build — this is exactly what CI runs
mkdocs build --strict
```

**`mkdocs build --strict` must exit 0 before you push.** Strict mode treats warnings as errors, so it catches two common mistakes:

- a page referenced in `mkdocs.yml` `nav` that does not exist
- a link or anchor that does not resolve

## Adding or Changing a Page

1. Write or edit the Markdown under `docs/`.
2. **New pages must be added to `nav` in `mkdocs.yml`** — an unregistered page is a build failure.
3. Run `mkdocs build --strict` and fix every warning.
4. Commit the page on its own with a Conventional Commit message.

## Writing Style

These rules are not negotiable — they keep the docs useful to a first-time reader:

- **Short, direct sentences.** No filler.
- **No inflated language.** Words like "seamlessly", "robust", "powerful", and "leverages" are banned. Say what it does.
- **Real numbers over vague claims.** Write "polls every 5s when containers are stable", not "polls frequently".
- **Both audiences.** A non-technical reader and a grant reviewer should follow the introduction; a contributor should find the API reference complete without reading source code.
- **No unverified claims.** If a contract ID, endpoint, or command hasn't been run, don't document it as working.

## Commit Message Format

We use [Conventional Commits](https://www.conventionalcommits.org/):

```
docs: add WebSocket reconnection section
docs: fix broken link in quickstart
chore: update mkdocs nav for new guide
```

Types you'll use here: `docs`, `chore`, `fix`.

## Pull Request Guidelines

- **One page or one concern per PR** — don't bundle unrelated edits
- **Show the build passing** — paste the `mkdocs build --strict` result if CI can't be linked
- **Describe what and why** — not just what changed
- Keep PRs small; under 300 lines of diff is a good target

## Reporting Issues

Use [GitHub Issues](https://github.com/StellarYard/stellaryard-docs/issues) for:

- Broken or missing pages
- Instructions that don't work when followed literally
- Links that 404

For security vulnerabilities, follow [SECURITY.md](./SECURITY.md) instead — do not open a public issue.

## License

By contributing, you agree that your contributions will be licensed under the Apache License 2.0.
