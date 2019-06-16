set -U FZF_LEGACY_KEYBINDINGS 0

function fzf_git_checkout_branch -d "Fuzzy-find and checkout a branch"
    git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

bind -e \cf '__fzf_find_file'
bind -e -M insert \cf '__fzf_find_file'

if bind -M insert >/dev/null 2>/dev/null
    bind -M insert \cxf '__fzf_find_file'
end

bind \cxb 'fzf_git_checkout_branch'
