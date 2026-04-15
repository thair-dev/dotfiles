# Dotfiles

Minimal WSL-focused dotfiles for a fast, reproducible shell setup.

## Overview

- Shell: zsh
- Plugin manager: zinit
- Prompt: Powerlevel10k (minimal config)
- Tools: zoxide, fd, ripgrep, fzf
- Editor: Vim (lean plugin set)
- SSH agent: systemd
- Python: uv

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
    .ssh/
      config
  codex/
    AGENTS.md
    install.ps1
    README.md

## Setup

git clone https://github.com/thair-dev/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh
exec zsh

## SSH

SSH config is installed to ~/.ssh/config if not already present.

You are responsible for:
- generating keys (ssh-keygen)
- adding keys to GitHub

## Codex (Windows)

Windows-native Codex setup is provided under:

codex/

See codex/README.md for instructions.
