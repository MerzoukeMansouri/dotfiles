# Powerlevel10k instant prompt (must be first)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

for f in ~/.zsh/conf.d/*.zsh(N); do source "$f"; done

# Local overrides (secrets, machine-specific — not versioned)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
