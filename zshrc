# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="hiasen"
ZSH_CUSTOM=$HOME/.zsh_custom
plugins=(git pip sudo systemd virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

alias dotfiles_pull='git --git-dir ~/.dotfiles/.git pull'

PATH=$PATH:$HOME/.bin:$HOME/.scripts
EDITOR=vim
