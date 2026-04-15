# Codex Windows Setup

Windows-native Codex configuration for this repository.

Target:

- Windows 11
- PowerShell
- Codex GUI
- WSL may be installed, but this setup does not use it

## Overview

This directory contains:

- `install.ps1`: bootstrap script for required CLI tools and Codex setup
- `AGENTS.md`: Codex behavior configuration

Goal: a minimal, reproducible Codex environment aligned with this repo's workflow.

## Setup

From the dotfiles root:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\codex\install.ps1
```

After completion:

- Fully quit Codex
- Start Codex again
- Open a new session

## AGENTS.md

The repo configuration is:

```text
codex/AGENTS.md
```

Codex expects this file at:

```text
C:\Users\<user>\.codex\AGENTS.md
```

The install script copies it automatically.

You may modify the local copy for machine-specific behavior.

## Behavior

The configuration enforces:

- CLI-first workflow using `rg`, `fd`, and `git`
- Windows-native execution for Codex tasks
- Minimal, production-grade changes
- Explicit failure reporting instead of guessing

See `AGENTS.md` for exact rules.

## Notes

- PATH changes require a full Codex restart
- Codex reads its environment at startup
- WindowsApps Python stubs can shadow real Python installs
- WinGet installs typically expose `rg`, `fd`, `fzf`, and `uv` via PATH after restart

## Scope

This is intentionally minimal.

It does not:

- configure your full Windows environment
- manage PATH manually
- install WSL tooling

It only ensures Codex operates correctly in a Windows-native workflow.
