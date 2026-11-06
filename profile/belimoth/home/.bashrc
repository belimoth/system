export MSYS=winsymlinks:nativestrict

export USER=belimoth
export GITHUB_USER=belimoth
export GITHUB_TOKEN=$( cat ~/desktop/null/key/token-gh )

export PATH=$PATH:~/desktop/user
export PATH=$PATH:~/desktop/user/profile/$USER
set -o allexport

init() {
	source init.sh
}

init

source rc-bash.sh
source rc-git.sh
source rc-ssh-agent.sh

alias ls="ls -1"
[[ -x $( command -v python ) ]] || [[ -x $( command -v python3 ) ]] && alias python=python3

# todo

# use aws_cli
# use git
# use git_extra
# use python
# use python_extra
# use vs_code

update() {
	python -m pip install --upgrade pip
	scoop update '*'
	butler upgrade --assume-yes
}

export SHLVL=1

[[ -t 1 ]] && [[ -x zsh ]] && exec zsh
