set -x SHELL fish

# $PATH
set fish_user_paths /usr/local/bin $fish_user_paths
set fish_user_paths /usr/local/sbin $fish_user_paths
set fish_user_paths ~/src/github.com/handlename/kayac-private/bin $fish_user_paths
set fish_user_paths ~/bin $fish_user_paths

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
