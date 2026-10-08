# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in StellarYard's documentation site or its build pipeline, please report it responsibly.

**Do NOT open a public GitHub issue for security vulnerabilities.**

Instead, please email: **security@stellaryard.dev**

Include:

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

## Response Timeline

- **Acknowledgment**: Within 48 hours
- **Initial assessment**: Within 1 week
- **Fix or mitigation**: Depends on severity, typically within 2 weeks

## Scope

This security policy applies to:

- The MkDocs configuration and build pipeline in this repository
- The GitHub Actions workflow that publishes the site
- Documentation content that could mislead a user into an unsafe action (for example, an instruction that exposes a private key)

## Out of Scope

- The `stellaryard-core`, `stellaryard-cli`, and `stellaryard-dashboard` applications — report those against the relevant repository
- Third-party Docker images (Horizon, Soroban RPC) — report issues to their respective maintainers
- Stellar network protocol issues — report to Stellar Development Foundation
- Broken links and typographical errors — use regular GitHub issues

## Key Security Considerations

### Build Pipeline

The `Deploy Docs` workflow runs on pushes to `main` and publishes to GitHub Pages. Changes to `.github/workflows/` should be reviewed like code changes: no third-party actions pinned to mutable tags, and no untrusted input interpolated into `run:` blocks.

### No Secrets in Documentation

Documentation in this repo is public. Never commit API keys, mnemonics, seed phrases, RPC admin tokens, or private endpoints — including in code examples. Use clearly fake placeholders in every example.

### Signer and Key Handling

Where the docs describe the core Signer interface, examples must never show real key material or encourage pasting a secret on a command line. Point readers at environment variables instead.

## Disclosure Policy

We follow responsible disclosure. We will:

- Credit reporters (unless they prefer anonymity)
- Not pursue legal action for good-faith security research
- Work with reporters on disclosure timing
