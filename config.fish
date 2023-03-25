set -x SHELL (which fish)

# $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH ~/src/github.com/handlename/kayac-private/bin $PATH
set -x PATH ~/bin $PATH

# source *.fish
set config_dir (dirname (status -f))

source $config_dir/config_fisher.fish
source $config_dir/config_fzf.fish

if [ (uname) = 'Darwin' ]
    source $config_dir/config_homebrew.fish
end

source $config_dir/config_asdf.fish
source $config_dir/config_1password.fish
source $config_dir/config_direnv.fish
source $config_dir/config_aws.fish # prefix: \cxa
source $config_dir/config_docker.fish #prefix: \cxd
source $config_dir/config_git.fish # prefix: \cxg
source $config_dir/config_github.fish # prefix: \cxh
source $config_dir/config_perl.fish
source $config_dir/config_ssh.fish
source $config_dir/config_vscode.fish

source $config_dir/config_alias.fish
# source $config_dir/config_tide.fish

source $config_dir/config_emacs.fish
