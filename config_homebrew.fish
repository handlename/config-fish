eval (/opt/homebrew/bin/brew shellenv)

# https://github.com/settings/applications#personal-access-tokens
# set -x HOMEBREW_GITHUB_API_TOKEN SECRET
set -x HOMEBREW_NO_ANALYTICS 1

# for curl
fish_add_path (brew --prefix)/opt/curl/bin $PATH
