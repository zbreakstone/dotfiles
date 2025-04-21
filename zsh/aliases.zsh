# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias o='open .'  # macOS: open Finder here
alias c='clear'

# LS
alias ls='eza --icons --group-directories-first --color=always'  # Use eza to colorize ls
alias ll='ls -l'
alias la='ls -la'
alias lh='ls -lh'
alias lha='ls -lha'

# Git basics
alias gs='git status -sb'
alias gc='git commit -v'
alias gp='git push'

# Network helpers
alias myip="curl ifconfig.me"
alias ports="lsof -i -P | grep LISTEN"