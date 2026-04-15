# Dotfiles

Minimal, reproducible WSL environment with systemd services, SSH agent management, and Python tooling via uv.

## Overview

- Shell: zsh
- Plugin manager: zinit
- Prompt: Powerlevel10k (minimal config)
- Tools: zoxide, fd, ripgrep, fzf
- Editor: Vim (lean plugin set)
- SSH agent: systemd (user service)
- Python: uv (no system Python assumptions)

## Design

- Copy-based install (rsync), no symlinks
- No environment mutation beyond required setup
- Separation of install-time and runtime concerns
- No secrets tracked in repository
- Intended to be reproducible from a clean WSL install

## Structure

dotfiles/
  install.sh
  README.md
  .gitignore
  zsh/
    .zshrc
    .config/zsh/
      aliases.zsh
      env.zsh
      plugins.zsh
  git/
    .gitconfig
  vim/
    .vimrc
  p10k/
    .p10k.zsh
  systemd/
    .config/systemd/user/
      ssh-agent.service
  ssh/
    config
  codex/
    AGENTS.md
    install.ps1
    README.md

## Setup

```sh
git clone https://github.com/thair-dev/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh
exec zsh
```

## Git

A default Git configuration is provided under git/.gitconfig.

This includes a preconfigured user identity and SSH signing setup. You should review and update these values to match your own environment:

- user.name
- user.email
- user.signingkey

## SSH

The tracked SSH client config lives at `ssh/config` and is installed to `~/.ssh/config` if not already present.

You are responsible for:
- generating keys (ssh-keygen)
- adding keys to GitHub

## Codex (Windows)

Windows-native Codex setup is provided under:

codex/

See codex/README.md for instructions.
