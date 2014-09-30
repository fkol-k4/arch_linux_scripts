#
# ~/.bash_profile
#

##  Set PATH so it includes user's private .local/bin if it exists
#   Added after the installation
[[ -d "$HOME/.local/bin" ]] && PATH="$PATH:$HOME/.local/bin" && export PATH

# set PATH so it includes user's private .bin if it exists
#   Added after the installation
[[ -d "$HOME/.bin" ]] && PATH="$PATH:$HOME/.bin" && export PATH

##  Execute ~/.bashrc if it exists
#   Default Arch installation
[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
