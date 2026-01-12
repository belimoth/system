# usage (in .bashrc):
# source $path-to-system/script/rc-bash.sh

PS1="\w> "
# PS1="\u@\h \w> "

set -o nounset

# history

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# TODO this captures history even when the terminal is killed, but interferes with "erasedups"
export PROMPT_COMMAND="history -a"
