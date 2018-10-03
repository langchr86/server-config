
# Source bash definitions
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
if [ -f /etc/bash_completion.d/git ]; then
  source /etc/bash_completion.d/git
fi

# source own tools
if [ -f ./tmux-helper.bash ]; then
  source ./tmux-helper.bash
fi
if [ -f ./git-helper.bash ]; then
  source ./git-helper.bash
fi


# set regular executed command before prompt printing
PROMPT_COMMAND="git-find-head-file; $PROMPT_COMMAND"

# definition of bash prompt
export PS1=$GIT_PROMPT


export HISTSIZE=9999
export HISTFILESIZE=99999
