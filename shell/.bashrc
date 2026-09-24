#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

stow --dir=$HOME/hyprland-dotfiles --target=$HOME config shell local

if [[ $(tty) == "/dev/tty1" ]]; then
    exec start-hyprland
fi

alias ff="fastfetch"
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/home/iv/.local/share/flatpak/exports/share
# Added by docksym installer
export PATH="$HOME/.local/share/bin:$PATH"
