exit 0

# resources

# http://rabexc.org/posts/using-ssh-agent
# http://rabexc.org/posts/pitfalls-of-ssh-agents
# https://docs.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases
# https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

#

# create a new key (follow the prompt)
ssh-keygen -t ed25519 -C $email

# create a new key, in the default location (follow the prompt)
ssh-keygen -t ed25519 -C $email -f ~/.ssh/id_ed25519

# create a new key, in the default location, with no password
ssh-keygen -t ed25519 -C $email -f ~/.ssh/id_ed25519 -q -N ""

# open a public key, in the default location, for copying to github
code ~/.ssh/id_ed25519

#

# start ssh-agent
eval $( ssh-agent )

# add keys (from the default location)
ssh-add

# kill the agent
eval $( ssh-agent -k )

#

# test ssh
ssh -T git@github.com

#

# check if ssh-agent is already running
# TODO
# check if a specific identity is loaded in ssh-agent
# TODO
