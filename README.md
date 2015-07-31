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
3. Download Sublime Text 3: http://www.sublimetext.com/3

4. Install Package Control: https://packagecontrol.io/installation#st3

5. Install *Material Theme*

6. Navigate to Sublime Text Program File:
  ```
  cd Library/Application\ Support/Sublime\ Text\ 3/Packages/User;
  ```

7. Remove existing User Preference File:
  ```
  rm Preferences.sublime-settings;
  ```
  
8. Create symlinks for Sublime Text Preferences and Material Theme:
  ```
  ln -s ~/Documents/dotfiles/Preferences.sublime-settings;
  ln -s ~/Documents/dotfiles/Material-Theme.sublime-theme;
  ```

