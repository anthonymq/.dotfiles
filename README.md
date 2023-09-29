# .dotfiles
Store my dotfiles

## Prerequisites
- git
- font-jetbrains-mono-nerd-font
- ripgrep
- tmux
- thefuck
- nvm
- neovim
- lazygit
- git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


## Start from scratch
```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```


## Install dotfiles on a new system
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare <git-repo-url> $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

config checkout
config config --local status.showUntrackedFiles no
```

## My Neovim Development workflow
```
tmux new -s Session # open a tmux Session
tmux ls # list sessions
tmux detach # exit the current session
tmux attach -t Session # re enters the session

# In a tmux session
<C-space> s : show the different sessions

# Splits
<C-space> % : split vertically
<C-space> " : split horizontally
# Navigate splits
Ctrl + (hjkl)

# Resize splits
<C-space> + (hjkl) ou m (maximize)

# Windows
<C-space> c # new Window
<C-space> number # navigate to the window number x 
<C-space> n or p # navigate to previous or next window
<C-space> w # show all windows
```
