
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

export HISTSIZE=9999
export HISTFILESIZE=99999
