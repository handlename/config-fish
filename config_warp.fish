# https://docs.warp.dev/features/subshells
if status is-interactive
    printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": {"shell": "fish"}}\x9c'
end
