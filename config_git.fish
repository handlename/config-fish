eval (hub alias -s)
alias g 'hub'

# functions
function git-cd
    set -l topdir (git rev-parse --show-toplevel)
    set -l dir (git ls-files --full-name $topdir | grep '/' | perl -nE 's![^/]+$!!; say' | sort | uniq | fzf --preview="ls -la $topdir/{}")
    cd "$topdir/$dir"
    commandline --function repaint
end

function git-checkout-branch
    set branch (git branch --all | grep -v HEAD | string trim | fzf --no-multi)
    git checkout (echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
    echo -e '\n'
    commandline -f repaint
end

# keybindings

bind \cxgb git-checkout-branch
bind \cxgc git-cd
bind \cxgg __ghq_repository_search

# keybindings (erase)
bind --erase \cg '__ghq_repository_search'
