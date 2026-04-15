# Codex Windows Setup

Windows-native Codex configuration for this repository.

## Target

- Windows 11
- PowerShell
- Codex GUI

WSL may be installed, but this setup does not use it.

## Overview

This directory contains:

- install.ps1: bootstrap script for CLI tools and Codex setup
- AGENTS.md: Codex behavior configuration

## Setup

From the repository root:

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\codex\install.ps1

After completion:
- fully quit Codex
- restart Codex
- open a new session

## Configuration

Codex expects:

C:\Users\<user>\.codex\AGENTS.md

The install script copies the repo configuration automatically.

## Behavior

- CLI-first workflow (rg, fd, git)
- Windows-native execution
- minimal, production-grade changes
- explicit failure reporting

## Notes

- restart Codex after installation (PATH is read at startup)
- WindowsApps Python stubs may shadow real Python installs
- WinGet installs expose tools after restart

## Scope

This setup is intentionally minimal.

It does not:
- configure the full Windows environment
- manage PATH manually
- install WSL tooling
