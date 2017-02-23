
# tmux helper
if [ -f ./tmux-helper.bash ]; then
	source ./tmux-helper.bash
fi

# git settings
if [ -f ./git-prompt.bash ]; then
	source ./git-prompt.bash
fi
export GIT_EDITOR=nano
alias gitk="gitk --all"

# User specific aliases and functions
alias ll="ls -lhA --color=auto"
export LS_COLORS='di=0;35'

export HISTSIZE=9999
export HISTFILESIZE=99999
