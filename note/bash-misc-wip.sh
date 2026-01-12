exit 0



# bash disable history
unset HISTFILE
# OR
set +o history

# bash clear history
history -c

# bash disable builtin
enable -n echo

# bash, expand aliases when running in non-interactive context
shopt -s expand_aliases

# bash help
help



# https://unix.stackexchange.com/questions/48994/how-to-run-a-program-in-a-clean-environment-in-bash

# run a command with a clean environment TODO test
env -i your_command

# run bash with a clean environment TODO test
env -i bash --noprofile --norc

# run bash as if it were a "fresh login" TODO test
env -i HOME="$HOME" bash -l -c 'your_command'

# more comprehensive
env -i HOME="$HOME" LC_CTYPE="${LC_ALL:-${LC_CTYPE:-$LANG}}" PATH="$PATH" USER="$USER" somecommand
# and alternatively
ssh localhost somecommand



# https://stackoverflow.com/questions/2020812/how-can-i-view-all-the-git-repositories-on-my-machine
# https://gist.github.com/mzabriskie/6631607

# find all git dirs
find -name HEAD -execdir test -e refs -a -e objects \; -printf %h\\n



# assert that a variable is set
[[ -z $variable ]] && { echo error; exit 1; }
