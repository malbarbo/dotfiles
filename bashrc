# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


##############
## functions

load_script_if_exist() {
    if [[ -s "$1" ]]; then
        . "$1"
    fi
}

add_path_if_exist() {
    if [ -d "$1" ] ; then
        PATH="$1:$PATH"
    fi
}

##############
## bash

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

HISTSIZE=10000
HISTFILESIZE=10000

# update the values of LINES and COLUMNS
shopt -s checkwinsize

##############
## path

add_path_if_exist "$HOME/local/bin";
add_path_if_exist "$HOME/.local/bin";
add_path_if_exist "$HOME/.cargo/bin";

# enable completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
    if [ -d $HOME/.local/share/bash_completion/completions/ ]; then
        for f in $HOME/.local/share/bash_completion/completions/*; do
            . $f
        done
    fi
fi

##############
## variables
export EDITOR=vim


##############
## alias

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'


##############
## shell prompt

load_script_if_exist /etc/profile.d/vte.sh

if [[ "$TERM" == xterm* ]]; then
    export TERM=xterm-256color
    load_script_if_exist $HOME/.shell_prompt.sh
fi


##############
## nix
load_script_if_exist $HOME/.nix-profile/etc/profile.d/nix.sh
