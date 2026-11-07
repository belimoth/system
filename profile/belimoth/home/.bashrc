set -o allexport

MSYS=winsymlinks:nativestrict

USER=belimoth
GITHUB_USER=belimoth
GITHUB_TOKEN=$( cat ~/desktop/null/key/token-gh )

PATH=$PATH:~/desktop/user
PATH=$PATH:~/desktop/user/profile/$USER

source ~/desktop/user/init/init_bash.sh
source ~/desktop/user/init/init_git.sh
source ~/desktop/user/init/init_ssh.sh

user_init() {
	source ~/desktop/user/init/init.sh
}

user_init

alias ls="ls -1"
[[ -x $( command -v python ) ]] || [[ -x $( command -v python3 ) ]] && alias python=python3

# todo

# use aws_cli
# use git
# use git_extra
# use python
# use python_extra
# use vs_code

user_install() {
	scoop install 7zip
	scoop install cloc
	scoop install gh
	scoop install shellcheck
	scoop install wget
	scoop install yt-dlp
	scoop install zip
}

user_update() {
	python -m pip install --upgrade pip
	env --unset GITHUB_TOKEN scoop update
	env --unset GITHUB_TOKEN scoop update '*'
	butler upgrade --assume-yes
}

export SHLVL=1

[[ -t 1 ]] && [[ -x zsh ]] && exec zsh
