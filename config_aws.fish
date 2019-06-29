# functions

function aws-help

    set -l cachedir (dirname (status --current-filename))/cache
    set -l cmdfile  "$cachedir/awscli_commands.txt"

    if ! test -f "$cmdfile"
        __init-aws-help
    end

    set -l cmd (cat "$cmdfile" \
    | fzf --preview 'aws {1} {2} help' --bind 'ctrl-e:execute(echo {} | pbcopy && open https://docs.aws.amazon.com/cli/latest/reference/{1}/{2}.html)+abort')

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

    mkdir -p "$cachedir"
    git clone --depth 1 git@github.com:aws/aws-cli.git "$tmpdir"

    ls "$tmpdir/awscli/examples" \
    | xargs -I{} -n1 find "$tmpdir/awscli/examples/{}" \
    | egrep '\.rst$' \
    | perl -nE 'chomp; s/\.rst$//; @p=split "/"; say $p[-2]." ".$p[-1]' \
    > "$outfile"

    echo "aws command list created at $outfile"

    rm -rf "$tmpdir"
end

# keybindings

bind \cxah aws-help
