<p align="center">
  <img src="https://img.shields.io/badge/stellar-yard%20docs-blue?style=for-the-badge&logo=stellar&logoColor=white" alt="StellarYard Docs"/>
</p>

<h1 align="center">stellaryard-docs</h1>

<p align="center">
  The documentation site for StellarYard — every guide, API reference, and architecture page in one MkDocs site.
</p>

<p align="center">
  <a href="https://github.com/StellarYard/stellaryard-docs/blob/main/LICENSE"><img src="https://img.shields.io/github/license/StellarYard/stellaryard-docs?style=flat-square" alt="License"/></a>
  <a href="https://github.com/StellarYard/stellaryard-docs/actions"><img src="https://img.shields.io/github/actions/workflow/status/StellarYard/stellaryard-docs/deploy-docs.yml?style=flat-square&label=Docs" alt="Docs build"/></a>
  <a href="https://github.com/StellarYard/stellaryard-docs/issues"><img src="https://img.shields.io/github/issues/StellarYard/stellaryard-docs?style=flat-square" alt="Issues"/></a>
</p>

---

## What is StellarYard Docs?

This repo holds the published documentation for **StellarYard** — the local development environment for the Stellar network. It covers both audiences: a plain-language introduction for someone evaluating the project, and the API/architecture reference a contributor needs before opening a PR.

It builds with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) in **strict mode**, so a broken link or a page missing from `nav` fails the build instead of shipping.

## What's Inside

| Section | Pages |
|---------|-------|
| **Getting Started** | Installation, Quick Start, Configuration |
| **Architecture** | Overview, stellaryard-core, stellaryard-cli, stellaryard-dashboard |
| **API Reference** | Overview, Containers, Accounts, Contracts, Ledger, WebSocket |
| **Guides** | Local Development, Contract Deployment, Troubleshooting |
| **Contributing** | How to work on StellarYard itself |

## Quick Start

```bash
# Clone
git clone https://github.com/StellarYard/stellaryard-docs.git
cd stellaryard-docs

# Install build dependencies
pip install -r requirements.txt

# Serve locally with live reload
mkdocs serve

# Production build (same command CI runs — must exit clean)
mkdocs build --strict
```

The site builds to `site/` (git-ignored). Preview it with `mkdocs serve` at `http://127.0.0.1:8000`.

## Editing Pages

1. Every page lives under `docs/` as Markdown.
2. If you add a page, register it in `mkdocs.yml` under `nav` — **`mkdocs build --strict` fails on an unregistered or missing page**, which is deliberate.
3. Keep sentences short and direct. No filler words like "seamlessly", "robust", or "powerful". Use real numbers instead of vague claims.
4. Commit pages one at a time with Conventional Commit format: `docs: describe the page`.

## Related Repositories

| Repo | What it is |
|------|-----------|
| [stellaryard-core](https://github.com/StellarYard/stellaryard-core) | Orchestration engine and REST/WebSocket API |
| [stellaryard-cli](https://github.com/StellarYard/stellaryard-cli) | Scriptable terminal client |
| [stellaryard-dashboard](https://github.com/StellarYard/stellaryard-dashboard) | Web UI |

## Contributing

We welcome contributions! See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

- Check [open issues](https://github.com/StellarYard/stellaryard-docs/issues) for `ready` tasks
- Issues labeled `good-first-issue` are ideal for first-time contributors

## Maintainers

| Name | GitHub | Contact |
|------|--------|---------|
| Adejumo-2 | [@Adejumo-2](https://github.com/Adejumo-2) | [Telegram](https://t.me/Adejumo-2) |

## Security

Please report vulnerabilities per [SECURITY.md](./SECURITY.md) — not in a public issue.

## License

[Apache 2.0](./LICENSE)

---

<p align="center">
  Built for the Stellar ecosystem
</p>
