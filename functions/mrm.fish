function mrm --description 'mrm <dir>'
    set -l target_dir $argv[1]; test -n "$target_dir"; or set -l target_dir '.'

    set -l files (ls "$target_dir" | fzf --multi --preview "stat -x $target_dir/{}")

    for file in $files
        rm -r "$target_dir/$file"
    end
end
