(( $+commands[eza] )) && {
  alias ls='eza --icons --git'
  alias ll='eza -l --icons --git --header'
  alias la='eza -la --icons --git --header'
  alias lt='eza --tree --level=2 --icons --git'
  alias l='eza -lah --icons --git --header --group-directories-first'
}
(( $+commands[http] )) && alias https='http --default-scheme=https'
(( $+commands[btop] )) && alias top='btop'

alias jqc='pbpaste | jq .'
alias cpwd='pwd | pbcopy'
alias clast='fc -ln -1 | pbcopy'
alias tm='tmux' tma='tmux attach -t' tmn='tmux new -s' tml='tmux ls' tmk='tmux kill-session -t'
alias v='nvim' vim='nvim' vi='nvim'
alias lg='lazygit'
alias ghw='gh repo view --web'
alias idea='open -a "/Applications/IntelliJ IDEA.app"'
alias clode='ollama launch claude'
alias ssh-pluton='ssh -i ~/.ssh/hetzner_vps root@157.90.114.10'
alias ssh-saturne='ssh merzouke@saturne'
alias ssh-jupiter='ssh jupiter'
alias git-clean="git branch | grep -vE '^\*|main|develop' | xargs -n 1 git branch -D"
alias oc='opencode run "use caveman ultra mode"'

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
