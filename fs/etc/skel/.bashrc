# ~/.bashrc

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# history control
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s checkwinsize

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

