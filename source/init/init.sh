set -o allexport

use_os() {
    [[ $( uname --operating-system ) == "Msys" ]] || {
        echo "error: unsupported os"
        exit 1
    }
}

use_scoop() {
    [[ -x scoop ]] || powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"

    scoop --version || {
        echo "error: missing scoop"
        exit 1
    }
}

use() {
    [[ $( type -t use_$1 ) == function ]] || { echo error; return 1; }
    [[ $( type -t use_$1 ) == function ]] && use_$1
}

assert_python() {
    [[ $( command -v python ) == *"WindowsApps"* ]] && { echo "error: app execution alias detected" exit 1; }
    [[ -x $( command -v python ) ]] || { echo "error: python not installed"; exit 1; }
    [[ $( python -c "import sys; print( sys.version_info[0] )" ) == "3" ]] || { echo "error: python 3 not installed"; exit 1; }
}

assert_python_package() {
    [[ -z $1 ]] && {
        echo "error"
        exit 1
    }

    python -c "import $1" > /dev/null 2>&1 || {
        echo "error: package $1 not installed, run 'pip install $1'"
        exit 1
    }
}

#

install_github() {
    scoop install gh
    gh copilot --remove
    gh extension remove github/gh-copilot
    gh config set telemetry disabled
}

#

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

pull() {
	code_pull $@
}

save() {
	~/desktop/user/git/git_commit_empty
}
