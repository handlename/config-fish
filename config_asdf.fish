if ! which asdf >/dev/null
    return
end

if [ (uname -s) = Darwin ]
    source (brew --prefix asdf)/libexec/asdf.fish
    source (brew --prefix asdf)/share/fish/vendor_completions.d/asdf.fish
else
    source $HOME/.asdf/asdf.fish
end
