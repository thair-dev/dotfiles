# Dotfiles

Minimal WSL-focused dotfiles for a fast, reproducible shell setup.

## Overview

- Shell: zsh
- Plugin manager: zinit
- Prompt: Powerlevel10k (minimal config)
- Tools: zoxide, fd, ripgrep, fzf
- Editor: Vim (lean plugin set)
- SSH agent: systemd (custom unit for WSL)

## Design

- Copy-based install using rsync
- No symlinks and no stow
- Repository can be deleted after installation
- Powerlevel10k uses a small tracked config instead of wizard output
- Python environments are supported but not auto-initialized
- No shell frameworks or heavy abstractions

## Structure

```text
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

## Codex (Windows)

Windows-native Codex setup is provided under:

codex/

See codex/README.md for instructions.
