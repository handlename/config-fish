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
abbr --add tf terraform

function aws-exec
    if [ -z $AWS_PROFILE ]
        echo 'please set $AWS_PROFILE' >&2
        return
    end
    command aws-vault exec $AWS_PROFILE -- aws $argv
end

# docker
abbr --add dr docker run -it --rm --entrypoint bash

# bat
abbr --add jqb 'jq -S | bat -l json'
