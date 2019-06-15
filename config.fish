# $PATH
set fish_user_paths /usr/local/bin $fish_user_paths
set fish_user_paths /usr/local/sbin $fish_user_paths
set fish_user_paths ~/src/github.com/handlename/kayac-private/bin $fish_user_paths
set fish_user_paths ~/bin $fish_user_paths

# fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -g fisher_path ~/.config/fish/fisher
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

function fisher_add_package
    set package $argv[1]

    if not fisher ls | fgrep "$package" >/dev/null
        fisher add "$package"
    end
end


# ssh
set -x SSH_AUTH_SOCK (/bin/launchctl getenv SSH_AUTH_SOCK)

# homebrew
# https://github.com/settings/applications#personal-access-tokens
# set -x HOMEBREW_GITHUB_API_TOKEN SECRET
set -x HOMEBREW_NO_ANALYTICS 1

# source hilighter
set -x LESS ' -R '

# for Github
# set -x GITHUB_TOKEN SECRET

# sudo
# http://archive.blog.hekt.org/archives/5085/
alias sudo='sudo '

# ls
alias l (find (brew --prefix vim)/ -name less.sh)
alias ls 'ls -G'
alias la 'ls -aG'
alias ll 'ls -lhG'
alias lla 'ls -lahG'

# rsync
alias rsync 'rsync -P'

# git
eval (hub alias -s)
alias g 'hub'

function git-cd
    set -l topdir (git rev-parse --show-toplevel)
    set -l dir (git ls-files --full-name $topdir | grep '/' | perl -nE 's![^/]+$!!; say' | sort | uniq | peco)
    cd "$dir"
end

bind \cxc git-cd

# perl
alias pd 'LANG=C perldoc'
alias pl './vendor/bin/carton exec perl -Ilib'
alias pv 'prove -l'
alias pvv './vendor/bin/carton exec prove -lv'

# emacs
alias e 'emacsclient -n'

# mosh
alias mosh 'LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 mosh'
