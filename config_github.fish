# for Github
# set -x GITHUB_TOKEN SECRET

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

# keybindings

bind \cxhp github-switch-pr
bind \cxho github-open-pr
