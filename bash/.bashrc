
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
if [ -f ~/tmux-helper.bash ]; then
  source ~/tmux-helper.bash
fi
if [ -f ~/git-helper.bash ]; then
  source ~/git-helper.bash
  PROMPT_COMMAND="git-find-head-file; $PROMPT_COMMAND"
  export PS1=$GIT_PROMPT
fi

export HISTSIZE=9999
export HISTFILESIZE=99999
