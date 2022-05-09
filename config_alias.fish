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
alias pd 'env LANG=C perldoc'
alias pl './vendor/bin/carton exec perl -Ilib'
alias pv 'prove -l'
alias pvv './vendor/bin/carton exec prove -lv'

# emacs
alias e 'emacsclient -n'

# mosh
alias mosh 'LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 mosh'

# aws
alias aws aws-exec
abbr --add aw aswrap
abbr --add av 'aws-vault exec $AWS_PROFILE --'
abbr --add ap 'AWS_PROFILE='

function aws-exec
    if [ -z $AWS_PROFILE ]
        echo 'please set $AWS_PROFILE' >&2
        return
    end
    command aws-vault exec $AWS_PROFILE -- aws $argv
end

# terraform
abbr --add tf terraform
abbr --add tfa 'TF_CLI_ARGS=\'\''
abbr --add tfaa 'TF_CLI_ARGS_apply=\'\''
abbr --add tfap 'TF_CLI_ARGS_plan=\'\''

# docker
abbr --add dr docker run -it --rm --entrypoint bash

# bat
abbr --add jqb 'jq -S | bat -l json'
