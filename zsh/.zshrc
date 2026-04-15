# XDG base directories (define early)
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Enable Powerlevel10k instant prompt. Keep this near the top.
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Only continue for interactive shells
[[ -o interactive ]] || return

ZSH_CONFIG_DIR="$XDG_CONFIG_HOME/zsh"

# History configuration
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000
[[ -d "${HISTFILE:h}" ]] || mkdir -p "${HISTFILE:h}"

# Shell options
setopt auto_cd
setopt extended_glob
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt interactive_comments
setopt no_beep
setopt prompt_subst
setopt share_history

# Load modular config
[[ -r "$ZSH_CONFIG_DIR/env.zsh" ]] && source "$ZSH_CONFIG_DIR/env.zsh"
[[ -r "$ZSH_CONFIG_DIR/aliases.zsh" ]] && source "$ZSH_CONFIG_DIR/aliases.zsh"

# Zinit setup
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
if [[ -r "$ZINIT_HOME/zinit.zsh" ]]; then
  source "$ZINIT_HOME/zinit.zsh"
  [[ -r "$ZSH_CONFIG_DIR/plugins.zsh" ]] && source "$ZSH_CONFIG_DIR/plugins.zsh"
else
  print -u2 "zinit not found. Run ~/dotfiles/install.sh"
fi

# uv shell completion (must be before compinit)
if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi

# Completion system
fpath=("$HOME/.zfunc" $fpath)
typeset -U fpath
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

zmodload zsh/complist 2>/dev/null || true
autoload -Uz compinit
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Powerlevel10k config
[[ -r "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# Optional highlighting hook
if (( $+functions[load_zsh_highlighting] )); then
  load_zsh_highlighting
fi
