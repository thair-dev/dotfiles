# Prompt.
zinit ice lucid depth=1
zinit light romkatv/powerlevel10k

# Completions must load before compinit in .zshrc.
zinit ice lucid depth=1
zinit light zsh-users/zsh-completions

# Interactive assistance.
zinit ice lucid depth=1
zinit light zsh-users/zsh-autosuggestions

load_zsh_highlighting() {
  # Load highlighting last so it can observe the final line editor state.
  zinit ice lucid depth=1
  zinit light zdharma-continuum/fast-syntax-highlighting
}
