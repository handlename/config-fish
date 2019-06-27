eval (hub alias -s)
alias g 'hub'

# functions
function git-cd
    set -l topdir (git rev-parse --show-toplevel)
    set -l dir (git ls-files --full-name $topdir | grep '/' | perl -nE 's![^/]+$!!; say' | sort | uniq | fzf --preview="ls -la $topdir/{}")
    cd "$topdir/$dir"
    commandline -f repaint
end

# keybindings
bind \cxc git-cd
