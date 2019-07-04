# functions

function aws-help
    set -l cachedir (dirname (status --current-filename))/cache
    set -l cmdfile  "$cachedir/awscli_commands.txt"

    if ! test -f "$cmdfile"
        __init-aws-help
    end

    set -l cmd (cat "$cmdfile" \
    | fzf --preview 'aws {1} {2} help' \
          --bind    'ctrl-e:execute(echo {} | pbcopy && open https://docs.aws.amazon.com/cli/latest/reference/{1}/{2}.html)+abort'
    )

    if ! test -n "$cmd"
        commandline --function repaint
        return
    end

    commandline --insert "$cmd "
end

function __init-aws-help
    set -l tmpdir (mktemp -d)
    set -l cachedir (dirname (status --current-filename))/cache
    set -l outfile  "$cachedir/awscli_commands.txt"
    rm -f "$outfile"

    mkdir -p "$cachedir"
    git clone --depth 1 git@github.com:boto/botocore.git "$tmpdir"

    set -l services (
    find "$tmpdir/botocore/data" -depth 1 -type d \
    | perl -nE '@parts=split "/"; print $parts[-1]' \
    | sort \
    )

    for service in $services
        set -l file (find "$tmpdir/botocore/data/$service" -name 'service-2.json' | tail -1)
        set -l operations (
        cat "$file" \
        | jq -r '.operations | keys | .[]' \
        | perl -pnE 's/([A-Z])/-\l\1/g; s/-//' \
        | sort \
        )

        for operation in $operations
            echo "$service $operation" >> "$outfile"
        end
    end

    echo "aws command list has been created at $outfile"

    rm -rf "$tmpdir"
end

# keybindings

bind \cxah aws-help
