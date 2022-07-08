#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias dotfiles_git='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

eval "$(starship init bash)"
