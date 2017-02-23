# Setup some helper functions for git repos and use them in the
# customized command prompt.
#
# This looks as follows:
# [clang@vm-mbdeveloper master@mbsw /var/scs/clang/mbsw]$
# [<user>@<machine>   <branch>@<repo>   <absolute_path>]$
#
# Use with: "source ./git-prompt.bash" in .bashrc


# GIT functions
function find_git_branch {
	if [[ $head == ref:\ refs/heads/* ]]; then
		git_branch=" ${head#*/*/}"
	elif [[ $head != '' ]]; then
		git_branch=" ${head:0:6}"
	else
		git_branch=' (unknown)'
	fi
}

function find_git_head_file {
    local dir=$(pwd)
    local head=''
    local submod=''
    until [ "$dir" -ef / ]; do
	if [ -f "$dir/.git" ]; then
		submod=`basename $dir`
		git_at="@"
		git_repo="${submod}"
		until [ "$dir" -ef / ]; do
			if [ -f "$dir/.git/modules/$submod/HEAD" ]; then
				head=$(< "$dir/.git/modules/$submod/HEAD")
				find_git_branch
				return
			fi
			dir=`dirname $dir`
		done
	elif [ -f "$dir/.git/HEAD" ]; then
		git_at="@"
		git_repo="`basename $dir`"
		head=$(< "$dir/.git/HEAD")
		find_git_branch
		return
	fi
	dir=`dirname $dir`
    done
    git_branch=''
    git_at=''
    git_repo=''
}

# set regular executed command before prompt printing
PROMPT_COMMAND="find_git_head_file; $PROMPT_COMMAND"

# definition of bash prompt
export PS1="\[\e[0m\][\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0;35m\]\$git_branch\[\e[0m\]\$git_at\[\e[0;36m\]\$git_repo \[\e[0m\]\w]$\[\e[0m\]"
