# .dotfiles
Store my dotfiles

## Prerequisites
### Terminal
- /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
- brew install git 
- sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
- git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
- brew install font-jetbrains-mono-nerd-font
- brew install tmux bash zoxide fzf
### Neovim
- brew install ripgrep
- brew install fd
- brew install tmux
- brew install nvm
- brew install neovim
- brew install lazygit
- git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
### zsh plugins
- git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
- git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
- brew install thefuck

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


## Java
### Debugger
Mason : java-debug-adapter, jdtls
