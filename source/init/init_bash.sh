set -o allexport

PS1="\w> "
# PS1="\u@\h \w> "

HISTCONTROL=erasedups
HISTSIZE=10000
shopt -s histappend

PROMPT_COMMAND="history -a"
