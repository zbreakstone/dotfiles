# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"

# Prompt + Starship
source ~/dotfiles/zsh/prompt.zsh

# Aliases
source ~/dotfiles/zsh/aliases.zsh

# Git + fzf functions
source ~/dotfiles/zsh/git-fzf.zsh

# Utility functions (like mcd)
source ~/dotfiles/zsh/functions.zsh

# Tools
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh  # fzf keybindings & completion
eval "$(zoxide init zsh)"  # zoxide (smarter "z" command)