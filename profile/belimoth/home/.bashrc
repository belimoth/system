set -o allexport

PS1="\w> "
# PS1="\u@\h \w> "

HISTCONTROL=erasedups
HISTSIZE=10000
shopt -s histappend

PROMPT_COMMAND="history -a"

# TIMEFORMAT="%Rs"
# time source ~/desktop/user/profile/belimoth/init

source ~/desktop/user/profile/belimoth/init

SHLVL=1

[[ -t 1 ]] && [[ -x zsh ]] && exec zsh
