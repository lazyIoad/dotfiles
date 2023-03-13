# Areeb's dotfiles & related setup

Create `workspace` and setup dotfiles
```
WORKSPACE="/Users/areeb/Documents/workspace"
mkdir $WORKSPACE
cd $WORKSPACE
git clone git@git.sr.ht:~lazyload/dotfiles
ln -s $WORKSPACE/dotfiles/profiles/fish ~/.config/
ln -s $WORKSPACE/dotfiles/profiles/kitty ~/.config/
ln -s $WORKSPACE/dotfiles/profiles/nvim ~/.config/
ln -s $WORKSPACE/dotfiles/profiles/bat ~/.config/
```

Install brew packages
```
brew install --cask kitty
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install fish
brew install bat fzf neovim ripgrep telnet zoxide
```

Set fish as shell
```
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

Set fish environment variables
```
set -Ux EDITOR "nvim"
set -Ux WORKSPACE "/Users/areeb/Documents/workspace"
```

Add fish abbreviations
```
abbr -a -U -- ... 'z ../..'
abbr -a -U -- ws 'z workspace'
abbr -a -U -- ga 'git add'
abbr -a -U -- ga. 'git add .'
abbr -a -U -- gb 'git branch'
abbr -a -U -- gc 'git checkout'
abbr -a -U -- gc- 'git checkout -'
abbr -a -U -- gcb 'git checkout -b'
abbr -a -U -- gcm 'git checkout master'
abbr -a -U -- gcom 'git commit -m'
abbr -a -U -- gm 'git merge --squash'
abbr -a -U -- gp 'git pull --rebase'
abbr -a -U -- grem 'git rebase master'
abbr -a -U -- gl 'git log'
abbr -a -U -- gs 'git status'
abbr -a -U -- kssh 'kitty +kitten ssh'
abbr -a -U -- n nvim
abbr -a -U -- cpr 'cp -r'
abbr -a -U -- rmrf 'rm -rf'
abbr -a -U -- tarc 'tar -czvf'
abbr -a -U -- tarc 'tar -zxvf'
```

## TODO
- [] Setup git-crypt & fish history
- [] Fish/fzf integration improvements
