if which code >/dev/null
    string match -q "$TERM_PROGRAM" "vscode" and . (code --locate-shell-integration-path fish)
end

function codessh
    set -f host (_codessh_select_host)
    set -f home_dir (ssh "$host" 'cd; pwd')
    set -f parent "$home_dir"

    while true
        set -f next_parent (_codessh_select_dir $host $parent)

        if [ -z "$next_parent" ]
            return
        end

        set -f parent $next_parent
    end
end

function _codessh_select_host
    set -f filter $argv[1]
    if [ -z $filter ]
        set -f filter ''
    end

    echo (cat ~/.ssh/config ~/.ssh/conf.d/* \
        | egrep '^Host' \
        | awk '{print $2}' \
        | fgrep -v '*' \
        | fgrep $filter \
        | sort \
        | fzf)
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

function codevm
    set -f host (_codessh_select_host 'multipass.local')
    if [ -z "$host" ]
        return
    end

    set -f home_dir (ssh "$host" 'cd; pwd')

    ssh $host "find ~/src -maxdepth 3 -mindepth 3 -type d" \
        | fzf --preview "ssh $host 'ls {}'" \
              --bind "ctrl-e:execute(_codessh_open_dir $host '{}')+abort"
end
