#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##  Added after the installation:

# Source global bash.bashrc if it exists
[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

##  Terminal prompt setting:
#PS1='[\u@\h \W]\$ '

if [[ ${EUID} == 0 ]]; then
    PS1='\[\033[01;31m\]\u \[\033[01;30m\]@ $(lsb_release -sd): \[\033[00;31m\]\W/ \[\033[00m\]\$ '
    PS2='\[\033[01;31m\]\u: Please complete your command... \[\033[00m\]\$ '
else
    PS1='\[\033[01;30m\]$(lsb_release -sd) @ $(uname -r): \[\033[00;30m\]\W/ \[\033[00m\]\$ '
    PS2='\[\033[01;30m\]Please complete your command... \[\033[00m\]\$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


##  fkol-k4 additions
##  =================
GPG_KEY="AC5A0B22"
export EDITOR=/usr/bin/nano 

#   Aliases
alias fkol_date="date +%Y-%m-%d"
alias fkol_date-with-time="date +%Y-%m-%d-%T"
alias fkol_unhide-applications="sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /usr/share/applications/*.desktop "
alias fkol_unhide-gnome-startups="sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /usr/share/gnome/autostart/*.desktop "
alias fkol_unhide-startups="sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop "
alias fkol_getkey="sudo gpg --recv-keys --keyserver "
alias fkol_get_cower_key="sudo gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53 "
alias fkol_update-grub='sudo /usr/sbin/grub-mkconfig -o /boot/grub/grub.cfg'
alias pacman='pacman --color always'

#   Functions
function fkol_updates() {
    # Repository updates
    sudo pacman -Syyvu
    # AUR updates
    if [ `which pacaur` ]; then
        pacaur --check; pacaur --update
    elif [ `which yaourt` ]; then
        yaourt -Sau
    fi
    sync
}

function fkol_DE_reset() {
    # reset DE to defaults
    rm -rf $HOME/.cache
    rm -rf $HOME/.config/dconf
    rm -rf $HOME/.gconf
    rm -rf $HOME/.kde
    rm -rf $HOME/.xfce
    rm -rf $HOME/.cinnamon
}


#   Add ~/.bin/ && ~/.local/bin/ to PATH:
[[ -d "$HOME/.local/bin" ]] && PATH="$PATH:$HOME/.local/bin" && export PATH

