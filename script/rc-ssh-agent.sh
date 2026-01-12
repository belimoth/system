# usage (in .bashrc):
# source $path-to-system/script/rc-ssh-agent.sh

# usage:
# agent-start
# agent-list
# agent-clear
# agent-kill

# resources:
# system/notes/ssh-agent.sh

agent-start() {
	status=$( ssh-add -l > /dev/null 2>&1; echo $? )
	[[ $status == 2 ]] && eval $( ssh-agent )

	status=$( ssh-add -l > /dev/null 2>&1; echo $? )
	[[ $status == 1 ]] && ssh-add
}

agent-list() {
	ssh-add -l
}

agent-clear() {
	ssh-add -D
}

agent-kill() {
	eval $( ssh-agent -k )
}

# TODO this needs work, isn't triggered when terminal is killed in vs code
# trap agent-kill EXIT
# agent-start
