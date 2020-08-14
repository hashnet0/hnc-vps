# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
	;;
*)
	;;
esac

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi


if [[ $EUID -ne 0 ]]; then
	PS1='\[$(tput sgr0)\][\[$(tput bold)\]\[$(tput setaf 6)\]\u\[$(tput sgr0)\]@\[$(tput bold)\]\[$(tput setaf 6)\]\h\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput setaf 2)\]\W\[$(tput sgr0)\]]\$ '
else
	PS1='\[$(tput sgr0)\][\[$(tput bold)\]\[$(tput setaf 1)\]\u\[$(tput sgr0)\]@\[$(tput bold)\]\[$(tput setaf 1)\]\h\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput setaf 3)\]\w\[$(tput sgr0)\]]\[$(tput setaf 1)\]\[$(tput bold)\]#\[$(tput sgr0)\] '
fi

command_not_found_handle() {
	echo -e "$(tput sgr0)[bash] $(tput setaf 1)$(tput bold)command not found: $1$(tput sgr0)" >&2
	return 127
}

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -laph'
alias la='ls -A'
alias l='ls -CF'
