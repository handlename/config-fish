set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showuntrackedfiles 'yes'

set -g __fish_git_prompt_char_dirtystate '*'
set -g __fish_git_prompt_char_stagedstate '^'
set -g __fish_git_prompt_char_untrackedfiles '?'

function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

    if not test $last_status -eq 0
        printf "(code=%s%s%s)" (set_color --bold red) "$last_status" (set_color normal)
        printf '\f\r'
    end

    printf '\f\r'
    printf "%s%s:" (set_color --bold blue) (hostname)
    printf "%s%s" (set_color --bold yellow) (string replace "$HOME" '~' "$PWD")
    printf '%s%s' (set_color --bold green) (__fish_git_prompt)
    printf '\f\r'
    printf '%s$ ' (set_color normal)
end
