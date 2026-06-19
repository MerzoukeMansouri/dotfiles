z() {
  unfunction z zi 2>/dev/null
  eval "$(zoxide init zsh --cmd z)"
  z "$@"
}
zi() {
  unfunction z zi 2>/dev/null
  eval "$(zoxide init zsh --cmd z)"
  zi "$@"
}
alias cd='z' cdi='zi' ..='z ..' ...='z ../..' ....='z ../../..'
