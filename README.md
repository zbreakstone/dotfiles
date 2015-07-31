# These are my dotfiles!
### I hope to never lose them again.

1. Clone repo into Documents
  ```
  cd ~/Documents;
  git clone https://github.com/zbreakstone/dotfiles.git;
  ```

2. Create symlinks from the files in dotfiles folder to your user folder:
  ```
  cd ~;
  ln -s ~/Documents/dotfiles/.bash_profile;
  ln -s ~/Documents/dotfiles/.gitconfig;
  ```

