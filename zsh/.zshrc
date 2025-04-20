export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"

# --- Prompt -------------------------------------------------
autoload -Uz colors && colors          # enable %F/%f
setopt prompt_subst                    # allow $(…) in PS1

# cyan username, dimmed folder, git branch in yellow
PS1='%F{cyan}%n%f %F{244}%1~%f$(git_prompt_info) %# '

# helper for git branch display
git_prompt_info() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  echo " %F{3}(${branch})%f"
}

# --- Aliases -------------------------------------------------
alias ll='ls -l'
alias la='ls -la'
alias lh='ls -lh'
alias lha='ls -lha'
alias lha='ls -lha'

# --- Quick nav & system ---
alias ..='cd ..'
alias ...='cd ../..'
alias o='open .'                  # macOS: open Finder here
alias c='clear'

# --- Git shortcuts ---
alias gs='git status -sb'
alias gc='git commit -v'
alias gp='git push'

gco() {
  git branch --all \
    | grep -v HEAD \
    | sed 's/^[* ] //' \
    | fzf --preview='git log --oneline --graph --color=always --pretty=format:"%C(auto)%h %d %s [%cr]" {} | head -20' \
          --preview-window=right:70% \
    | xargs git checkout
}

gcs() {
  git log --oneline --decorate \
    | fzf --preview='git show --color=always {1}' \
          --preview-window=right:70% \
          --ansi \
    | awk '{print $1}' \
    | xargs git checkout
}

grestore() {
  git ls-files --deleted \
    | fzf --preview='git show HEAD:{}' \
          --preview-window=right:70% \
          --ansi \
    | xargs -I {} git checkout HEAD -- "{}"
}

gd() {
  git diff --name-only \
    | fzf --multi --preview='git diff --color=always {}' \
          --preview-window=right:70% \
          --ansi \
    | xargs git diff
}

gsp() {
  git stash list \
    | fzf --preview='echo {} | cut -d: -f1 | xargs git stash show -p --color=always' \
          --preview-window=right:70% \
          --ansi \
    | cut -d: -f1 \
    | xargs git stash pop
}

# --- Networking ---
alias myip="curl ifconfig.me"
alias ports="lsof -i -P | grep LISTEN"

# --- Make + cd in one go ---
mcd() { mkdir -p "$1" && cd "$1"; }

# --- Use eza to colorize ls ---
alias ls='eza --icons --group-directories-first --color=always'

# --- Starship theme ---
eval "$(starship init zsh)"

# fzf keybindings & completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide (smarter "z" command)
eval "$(zoxide init zsh)"