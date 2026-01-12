# usage (in script):
# source $path-to-system/script/source/common.sh

# usage (in script):
# assert-os
# assert-python
# assert-python-package $package

assert-os() {
    [[ $( uname --operating-system ) == "Msys" ]] || {
        echo "error: unsupported os"
        exit 1
    }
}

assert-python() {
    # TODO test
    [[ $( command -v python ) == *"WindowsApps"* ]] && {
        echo "error: app execution alias detected, consult 'docs/101/windows.txt'"
        exit 1
    }

    [[ -x $( command -v python ) ]] || {
        echo "error: python not installed"
        exit 1
    }

    [[ $( python -c "import sys; print( sys.version_info[0] )" ) == "3" ]] || {
        echo "error: python 3 not installed"
        exit 1
    }
}

assert-python-package() {
    [[ -z $1 ]] && {
        echo "error"
        exit 1
    }

    python -c "import $1" > /dev/null 2>&1 || {
        echo "error: package $1 not installed, run 'pip install $1'"
        exit 1
    }
}
