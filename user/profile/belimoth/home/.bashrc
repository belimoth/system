export MSYS=winsymlinks:nativestrict

export USER=belimoth
export GITHUB_USER=belimoth
export GITHUB_TOKEN=$( cat ~/desktop/null/key/token-gh )

export PATH=$PATH:~/desktop/user
export PATH=$PATH:~/desktop/user/profile/$USER

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

pull() {
	code_pull $@
}

edit() {
	[[ -z $1 ]] && {
		cd ~/desktop/code/$USER
		code . --reuse-window
		exit
	}

	[[ $1 == "user" ]] && {
		cd ~/desktop/user
		code . --reuse-window
		exit
	}

	code-edit $@
}

save() {
	git-commit-empty
}

update() {
	python -m pip install --upgrade pip
	scoop update '*'
	butler upgrade
}

export SHLVL=1

[[ -t 1 ]] && [[ -x zsh ]] && exec zsh
