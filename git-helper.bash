# GIT functions

function git-fixup {
  if [ $# -ne 1 ]; then
    echo "Invalid number of arguments. Expecting a single commit hash!"
  else
    local FIXUP_COMMIT="$1"
    local FIXUP_COMMIT_MESSAGE=$(git log --format=%B -1 $FIXUP_COMMIT)
    echo "Fixing up commit \"$FIXUP_COMMIT_MESSAGE\" ($FIXUP_COMMIT) with current staged changes"
    
    git commit --fixup "$FIXUP_COMMIT" && \
      GIT_SEQUENCE_EDITOR=: git rebase --interactive --autostash --autosquash "$FIXUP_COMMIT"~1
  fi
}

function git-find-branch {
  if [[ $head == ref:\ refs/heads/* ]]; then
    git_branch=" ${head#*/*/}"
  elif [[ $head != '' ]]; then
    git_branch=" ${head:0:6}"
  else
    git_branch=' (unknown)'
  fi
}

function git-find-head-file {
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
        git-find-branch
        return
      fi
      dir=`dirname $dir`
    done
  elif [ -f "$dir/.git/HEAD" ]; then
    git_at="@"
    git_repo="`basename $dir`"
    head=$(< "$dir/.git/HEAD")
    git-find-branch
    return
  fi
    dir=`dirname $dir`
  done
  git_branch=''
  git_at=''
  git_repo=''
}

#default git editor
export GIT_EDITOR=nano

# definition of bash prompt with repo name
#export GIT_PROMPT="\[\e[0m\][\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0;35m\]\$git_branch\[\e[0m\]\$git_at\[\e[0;36m\]\$git_repo \[\e[0m\]\w]$\[\e[0m\] "
# definition of bash prompt without repo name
export GIT_PROMPT="\[\e[0m\][\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0;35m\]\$git_branch \[\e[0m\]\w]$\[\e[0m\] "

# to use the git prompt you need this in .bashrc:
## # set regular executed command befor prompt printing
## PROMPT_COMMAND="git-find-head-file; $PROMPT_COMMAND"
## # definition of bash prompt
## export PS1=$GIT_PROMPT

# aliases
alias gitk="gitk --all"
alias gitl="git log --oneline"
alias gitg="git log --graph  --abbrev-commit --date=local --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset'"
alias gitfix="git-fixup"
alias gitri="git rebase -i"
alias gitrc="git rebase --continue"
alias gitrs="git rebase --skip"
alias gitra="git rebase --abort"
