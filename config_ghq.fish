# keybindings

bind -e \cg '__ghq_repository_search'
bind -e -M insert \cg '__ghq_repository_search'

if bind -M insert >/dev/null 2>/dev/null
    bind -M insert \cxg '__ghq_repository_search'
end

bind \cxg '__ghq_repository_search'
