set -x SHELL fish

# $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH ~/src/github.com/handlename/kayac-private/bin $PATH
set -x PATH ~/bin $PATH

# source *.fish
set config_dir (dirname (status -f))

source $config_dir/config_fisher.fish
source $config_dir/config_fzf.fish
source $config_dir/config_ghq.fish

source $config_dir/config_anyenv.fish
source $config_dir/config_direnv.fish
source $config_dir/config_git.fish
source $config_dir/config_homebrew.fish
source $config_dir/config_ssh.fish

source $config_dir/config_alias.fish
