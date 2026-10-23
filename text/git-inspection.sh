exit 0

# verify cwd is a git repo (note: modify for bare)
[[ -d ".git" ]] && echo "pass" || echo "fail"

# verify cwd is within a git repo (i.e., that git has a repo to operate on)
git rev-parse --show-toplevel > /dev/null 2>&1 && echo "pass" || echo "fail"

# get remote (origin)
git config --get remote.origin.url

# verify remote (origin) (note: modify for ssh clone)
[[ $(git config --get remote.origin.url) == https://github.com/$user/* ]] && echo "pass" || echo "fail"

# get current commit
git rev-parse HEAD

# get current commit (short)
git rev-parse --short HEAD

# get current branch name
git branch | grep \* | cut -d ' ' -f2

# verify current branch name
[[ $( git branch | grep \* | cut -d ' ' -f2 ) == $branch ]] && echo "pass" || echo "fail"

# verify that a branch exists locally (note: will pass if any object with name exists)
git rev-parse --verify $branch && echo "pass" || echo "fail"

# verify that a branch exists on remote (origin), without fetching
git ls-remote --quiet --heads --exit-code origin develop > /dev/null && echo "pass" || echo "fail"

# test for unstaged changes
! git diff-files --quiet -- && echo "pass" || echo "fail"

# test for uncommitted changes
! git diff-index --cached --quiet HEAD -- && echo "pass" || echo "fail"

# get count of commits BEHIND remote (origin) on current branch  (note: needs fetch)
git fetch
git rev-list --count HEAD...@{u}

# get count of commits BEHIND remote (origin) on given branch (note: needs fetch)
git rev-list --count $branch...origin/$branch

# get count of commits AHEAD OF remote (origin) on given branch (note: needs fetch)
git rev-list --count origin/$branch...$branch

# verify that the current branch is up-to-date (note: needs fetch)
[[ $( git rev-parse HEAD ) == $( git rev-parse @{u} ) ]] && echo "pass" || echo "fail"

# delete a git repo, leaving untracked files
git ls-files -z | xargs -0 rm -f
rm -rf ".git"

# delete python cache files, macos system files, and then empty folders
find . -name "*.pyc"     -delete
find . -name ".DS_Store" -delete
find . -type d -empty    -delete

# verify that a folder is empty
[[ -z "$(ls -A $folder)" ]] && echo "pass" || echo "fail"
