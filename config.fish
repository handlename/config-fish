# $PATH
set fish_user_paths /usr/local/bin $fish_user_paths
set fish_user_paths /usr/local/sbin $fish_user_paths
set fish_user_paths ~/src/github.com/handlename/kayac-private/bin $fish_user_paths
set fish_user_paths ~/bin $fish_user_paths

# souce *.fish
set config_dir ~/.config/fish

source $config_dir/config_fisher.fish
source $config_dir/config_fzf.fish
source $config_dir/config_ghq.fish

source $config_dir/config_git.fish
source $config_dir/config_homebrew.fish
source $config_dir/config_ssh.fish

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

# perl
alias pd 'LANG=C perldoc'
alias pl './vendor/bin/carton exec perl -Ilib'
alias pv 'prove -l'
alias pvv './vendor/bin/carton exec prove -lv'

# emacs
alias e 'emacsclient -n'

# mosh
alias mosh 'LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 mosh'
