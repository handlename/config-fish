set -x PATH ~/.anyenv/bin $PATH
status --is-interactive; and source (anyenv init -|psub)

# goenv
set -x PATH $GOROOT/bin $PATH
set -x PATH $GOPATH/bin $PATH
