set -U FZF_LEGACY_KEYBINDINGS 0

function fzf_git_checkout_branch -d "Fuzzy-find and checkout a branch"
    git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

bind \cxb 'fzf_git_checkout_branch'
