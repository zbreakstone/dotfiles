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

# --- Starship theme ---
eval "$(starship init zsh)"