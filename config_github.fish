# for Github
# set -x GITHUB_TOKEN SECRET

# completions

if which gh >/dev/null
    eval (gh completion -s fish)
end

# functions

function github-switch-pr
    set -l pr (gh pr list --state open --limit 100 2>/dev/null \
    | fzf --preview 'gh pr view (echo {} | cut -f1)' \
          --bind    'ctrl-e:execute(gh pr view --web (echo {} | cut -f1))' \
    | cut -f1
    )

    if ! test -n "$pr"
        commandline --function repaint
        return
    end

    gh pr checkout "$pr"

    echo -e '\n'
    commandline --function repaint
end

function github-open-pr
    gh pr view --web
    echo -e '\n'
    commandline --function repaint
end

function github-codespace-ssh
    set -f space (_github_select_codespace)

    if ! test -n "$space"
        commandline --function repaint
        return
    end

    gh codespace ssh -c $space
end

function github-codespace-open
    set -f space (_github_select_codespace)

    if ! test -n "$space"
        commandline --function repaint
        return
    end

    gh codespace code -c $space
end

function _github_select_codespace
    gh codespace list | fzf | awk '{print $1}'
end

# keybindings

bind \cxhp github-switch-pr
bind \cxho github-open-pr
