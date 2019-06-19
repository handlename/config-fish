set -U FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_OPTS '--layout=reverse --height 40%'

function fzf_git_checkout_branch
    set branch (git branch --all | grep -v HEAD | string trim | fzf --no-multi)
    git checkout (echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
    echo -e '\n'
    commandline -f repaint
end

bind -e \cf '__fzf_find_file'
bind -e -M insert \cf '__fzf_find_file'

if bind -M insert >/dev/null 2>/dev/null
    bind -M insert \cxf '__fzf_find_file'
end

bind \cxb 'fzf_git_checkout_branch'
