if [ (uname -s) = 'Darwin' ]
    source (brew --prefix asdf)/asdf.fish
else
    source $HOME/.asdf/asdf.fish
end
