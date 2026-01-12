# Integrating

1. link-home
2. unlinked, copy-home
3. unlinked, sourced

# Scripts

## SSH helpers
```sh
# in .bashrc
source ~/desktop/system/script/rc-ssh-agent.sh

agent-start
agent-clear
agent-kill

```

## Git helpers
```sh
git-check

git-log
git-log-graph
git-log-branches

git-sync
git-sync-rebase

git-amend
```

## Forge helpers
```sh
$( forge-url-gh $slug )
$( forge-url-bb $slug )

forge-create-repo-gh $slug
forge-create-repo-bb $slug
```
