# --- Git shortcuts ---
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