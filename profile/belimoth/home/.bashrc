export MSYS=winsymlinks:nativestrict

export PROFILE=belimoth
export GITHUB_USERNAME=belimoth

export PATH=$PATH:~/desktop/system/script
export PATH=$PATH:~/desktop/system/profile/$PROFILE/script

source rc-bash.sh
source rc-git.sh
source rc-ssh-agent.sh

alias ls="ls -1"
# alias python=python3

# todo

# use aws_cli
# use git
# use git_extra
# use python
# use python_extra
# use vs_code

clone () {
	code-clone $@
}

edit () {
	[[ $1 == "system" ]] && {
		cd ~/desktop/system
		code . --reuse-window
	} || {
		code-edit $@
	}

}

update() {
	python -m pip install --upgrade pip
	scoop update '*'
	butler upgrade
}

export SHLVL=1

[[ -t 1 ]] && [[ -x zsh ]] && exec zsh
