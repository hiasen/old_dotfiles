# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="hiasen"
ZSH_CUSTOM=$HOME/.zsh_custom

export UPDATE_ZSH_DAYS=60
COMPLETION_WAITING_DOTS="true"
plugins=(git pip sudo systemd)

source $ZSH/oh-my-zsh.sh

alias dotfiles_pull='git --git-dir ~/.dotfiles/.git pull'
alias mv='mv -i'
alias cp='cp -i'
alias pn='ping ntnu.no'

PATH=$PATH:$HOME/.bin:$HOME/.scripts
export EDITOR=vim
