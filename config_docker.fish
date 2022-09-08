function docker-image
    set -l image (docker images | fzf | awk '{print $1":"$2}')
    commandline --insert "$image"
end

function docker-container
    set -l id (docker container ls | fzf --header-lines=1 | awk '{print $1}')
    commandline --insert "$id"
end

bind \cxdi docker-image
bind \cxdc docker-container
