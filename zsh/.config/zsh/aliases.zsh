alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

pbcopy() {
  clip.exe
}

pbpaste() {
  powershell.exe -NoProfile -Command Get-Clipboard -Raw
}
