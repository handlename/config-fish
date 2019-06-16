set -Ux fish_user_paths ~/.anyenv/bin $fish_user_paths
status --is-interactive; and source (anyenv init -|psub)
