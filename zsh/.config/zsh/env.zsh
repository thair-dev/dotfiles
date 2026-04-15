export EDITOR=vim
export VISUAL=vim
export PAGER=less
export LESS='-FRX'
export PYTHONDONTWRITEBYTECODE=1

path=(
  "$HOME/.local/bin"
  "$HOME/bin"
  "$HOME/.cargo/bin"
  $path
)
typeset -U path PATH

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
