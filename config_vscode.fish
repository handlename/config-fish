if which code >/dev/null
    string match -q "$TERM_PROGRAM" "vscode" and . (code --locate-shell-integration-path fish)
end

function codessh
    set -f host (cat ~/.ssh/config | egrep '^Host' | awk '{print $2}' | fgrep -v '*' | fzf)
    set -f home_dir (ssh "$host" 'cd; pwd')
    set -f parent "$home_dir"

    while true
        set -f next_parent (_codessh_select_dir $host $parent)

        echo $next_parent

        if [ -z "$next_parent" ]
            echo 'canceled'
            return
        end

        set -f parent $next_parent
    end
end

function _codessh_select_dir
    set -f host $argv[1]
    set -f parent $argv[2]

    set -f dir (ssh $host "ls $parent" \
        | fzf --preview "ssh $host 'ls $parent/{}'" \
              --bind "ctrl-e:execute(_codessh_open_dir $host '$parent/{}')+abort"
    )

    if [ -z "$dir" ]
        return
    end

    echo "$parent/$dir"
end

function _codessh_open_dir
    set -f host $argv[1]
    set -f dir $argv[2]

    code --folder-uri "vscode-remote://ssh-remote+$host/$dir"
end
