#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info() {
  printf '\n==> %s\n' "$*"
}

info "Installing base packages"
sudo apt-get update
sudo apt-get install -y \
  ca-certificates \
  curl \
  fd-find \
  fzf \
  git \
  jq \
  openssh-client \
  ripgrep \
  rsync \
  vim \
  zoxide \
  zsh

info "Installing uv"
if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | INSTALLER_NO_MODIFY_PATH=1 sh
  export PATH="$HOME/.local/bin:$PATH"
fi
info "Installing base Python (uv)"
uv python install 3.13

info "Installing zinit"
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME/.git" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
else
  git -C "$ZINIT_HOME" pull --ff-only
fi

info "Installing vim-plug"
mkdir -p "$HOME/.vim/autoload"
curl -fsSLo "$HOME/.vim/autoload/plug.vim" \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

info "Configuring command shims"
mkdir -p "$HOME/.local/bin" "$HOME/.zfunc"
export PATH="$HOME/.local/bin:$PATH"

if ! command -v fd >/dev/null 2>&1 && command -v fdfind >/dev/null 2>&1; then
  ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi

info "Copying dotfiles"
mkdir -p "$HOME/.config/zsh" "$HOME/.config/git" "$HOME/.config/systemd/user"

rsync -av --no-perms --no-owner --no-group \
  "$DOTFILES_DIR/zsh/" "$HOME/"

rsync -av --no-perms --no-owner --no-group \
  "$DOTFILES_DIR/git/" "$HOME/"

rsync -av --no-perms --no-owner --no-group \
  "$DOTFILES_DIR/vim/" "$HOME/"

rsync -av --no-perms --no-owner --no-group \
  "$DOTFILES_DIR/p10k/" "$HOME/"

rsync -av --no-perms --no-owner --no-group \
  "$DOTFILES_DIR/systemd/" "$HOME/"

# SSH
info "Configuring SSH"
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
if [[ -e "$HOME/.ssh/config" ]]; then
  printf 'WARNING: ~/.ssh/config exists and will not be overwritten\n'
else
  rsync -av --no-perms --no-owner --no-group \
    "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"
fi
chmod 600 "$HOME/.ssh/config" 2>/dev/null || true

info "Enabling SSH agent service"
if ! systemctl --user show-environment >/dev/null 2>&1; then
  printf 'systemd user manager is unavailable.\n'
  printf 'Enable systemd in WSL, restart WSL, then rerun install.sh\n'
  exit 1
fi

systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service

info "Setting zsh as the default shell"
ZSH_BIN="$(command -v zsh)"
if command -v chsh >/dev/null 2>&1; then
  chsh -s "$ZSH_BIN" || printf 'Run manually: chsh -s %s\n' "$ZSH_BIN"
fi

info "Installing Vim plugins"
if ! vim +'PlugInstall --sync' +qa; then
  printf 'Vim plugin installation failed. Re-run manually with: vim +PlugInstall +qa\n'
fi

cat <<'EOF'

Done.

Open a new WSL shell.

If Powerlevel10k asks about fonts:
- install a Nerd Font in Windows Terminal
- or run: p10k configure

You can now delete the dotfiles repo if desired.

EOF
