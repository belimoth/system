exit 0

# resources (git)

# 	https://git-scm.com/docs
# 	https://git-scm.com/book/en/v2
# 	https://www.atlassian.com/git/tutorials

# resources (git branching commands)

# 	https://git-scm.com/docs/git-branch
# 	https://git-scm.com/docs/git-checkout
# 	https://git-scm.com/docs/git-switch

# resources (git branching tutorials)

# 	https://git-scm.com/book/en/v2/Git-Branching-Branch-Management
# 	https://www.atlassian.com/git/tutorials/using-branches
# 	https://github.blog/2019-08-16-highlights-from-git-2-23/

# list branches
git branch

# switch to a branch
git switch $branch

# switch to a branch (old)
git checkout $branch

# create a branch (without switching to it)
git branch $branch

# create a branch and switch to it
git switch --create $branch

# create a branch and switch to it (old)
git checkout --branch $branch

# create a branch and switch to it (smart)
git branch $branch && git switch $_
