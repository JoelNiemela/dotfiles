if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias dotfiles_git 'git --git-dir=~/.dotfiles_git/ --work-tree=~'

starship init fish | source
