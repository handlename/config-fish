function docker-image
    set -l image (docker images | fzf | awk '{print $1":"$2}')
    commandline --insert "$image"
end

bind \cxdi docker-image
