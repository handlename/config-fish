eval (hub alias -s)
alias git 'hub'
abbr g 'git'

# functions

function git-cd
    set -l topdir (git rev-parse --show-toplevel)

    set -l dir (git ls-files --full-name $topdir \
    | grep '/' \
    | perl -nE 's![^/]+$!!; say' \
    | sort \
    | uniq \
    | fzf --preview="ls -la $topdir/{}")

    cd "$topdir/$dir"
    commandline --function repaint
end

function git-switch-branch
    set branch (git branch --all \
    | grep -v HEAD \
    | string trim \
    | fzf --no-multi \
    )

    if test -z "$branch"
        commandline -f repaint
        return
    end

    git switch (echo "$branch" \
    | sed "s/.* //" \
    | sed "s#remotes/[^/]*/##" \
    )

    echo -e '\n'
    commandline -f repaint
end

function git-help
    set -l cmd (git help -a \
    | egrep '^  \S' \
    | xargs -n1 echo \
    | sort \
    | fzf --preview 'git help {} | head -20' \
          --bind    'ctrl-e:execute-silent(open dash://manpages:git-{})+abort' \
    )

    if ! test -n "$cmd"
        commandline --function repaint
        return
    end

    commandline --insert "$cmd "
end

# keybindings

bind \cxgb git-switch-branch
bind \cxgc git-cd
bind \cxgg __ghq_repository_search
bind \cxgh git-help

# keybindings (erase)
bind --erase \cg '__ghq_repository_search'
