function mcp --description 'mcp <src> [<target>]'
    set -l src_dir $argv[1]
    set -l target_dir $argv[2]; set -q target_dir; or set -l target_dir '.'

    set -l files (ls "$src_dir" | fzf --multi --preview "stat -x $src_dir/{}")

    for file in $files
        cp -R "$src_dir/$file" "$target_dir"
    end
end
