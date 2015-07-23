# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


##############
## functions

load_script_if_exist() {
    [[ -s "$1" ]] && . "$1"
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

# enable completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi


##############
## path

if [ -d "$HOME/local/bin" ] ; then
    PATH="$HOME/local/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
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


##############
## others
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh /usr/bin/lesspipe)"

