if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias dotfiles_git 'git --git-dir=$HOME/.dotfiles_git/ --work-tree=$HOME'

starship init fish | source
