set -x SHELL /usr/local/bin/fish

# $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH ~/src/github.com/handlename/kayac-private/bin $PATH
set -x PATH ~/bin $PATH

# source *.fish
set config_dir (dirname (status -f))

source $config_dir/config_fisher.fish
source $config_dir/config_fzf.fish

source $config_dir/config_anyenv.fish
source $config_dir/config_direnv.fish
source $config_dir/config_aws.fish # prefix: \cxa
source $config_dir/config_git.fish # prefix: \cxg
source $config_dir/config_github.fish # prefix: \cxh
source $config_dir/config_homebrew.fish
source $config_dir/config_perl.fish
source $config_dir/config_ssh.fish

source $config_dir/config_alias.fish

source $config_dir/config_emacs.fish
