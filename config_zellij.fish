# select layout via fzf,
# then run, or attach if session which name is same as layout.
# required envs: ZELLIJ_LAYOUT_DIR, ZELLIJ_LAYOUT_ROOT
function zellij-run-with-layout
    set -l layout (ls $ZELLIJ_LAYOUT_DIR/ \
        | sort \
        | perl -pnE 's/\.kdl//' \
        | fzf)

    if [ -z "$layout" ]
        echo 'canceled'
        return
    end

    set -l session (zellij list-sessions --short \
        | egrep '^'$layout'$')

    if [ -n "$session" ]
        zellij attach $session
        return
    end

    cd $ZELLIJ_LAYOUT_ROOT
    zellij --layout "$ZELLIJ_LAYOUT_DIR/$layout.kdl" -s $layout
end

bind \cxzr zellij-run-with-layout
