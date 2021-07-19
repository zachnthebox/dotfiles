USER_NAME="`whoami`"
GIT_DIRECTORY="$HOME/git"

# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER_NAME/.oh-my-zsh
export GPG_TTY=$(tty)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

DEFAULT_USER="$USER_NAME"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git colored-man-pages colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting github-kub)

# User configuration

export PATH="/usr/local/opt/gnupg@1.4/libexec/gpgbin:/Users/$USER_NAME/.npm-packages/bin:/Users/$USER_NAME/.npm-packages/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

############################
# Git
############################
alias c=clear
alias g="git"
alias ga="git add"
alias gap="git add -p"
alias gb="git branch"
alias gbt="git branch --track"
alias gc="git commit"
alias gca="gc --amend --no-edit"
alias go="git checkout"
alias gob="git checkout -b"
alias gco="git checkout"
alias gf="git fetch"
alias gmv="git mv"
alias gmf="git merge --ff-only"
alias gp="git push-u"
alias gs="git status"
alias gsh="git show"
alias gup="git pull --rebase && git remote update origin --prune"
alias gbail="git reset --hard HEAD@{upstream}"
alias branch="git symbolic-ref --short HEAD 2> /dev/null"
alias cbranch="git symbolic-ref --short HEAD 2> /dev/null | pbcopy"
alias gd="git diff"
alias grb="git rebase -i"
alias gcp="git cherry-pick"
alias lsg="find ./ -maxdepth 2 -name '\.git' -type d -exec sh -c '(cd {} && cd ../ && gitinfo)' \;"

alias grbc="git rebase —-continue"
alias grba="git rebase —-abort"
alias puff="rm -rf node_modules bower_components && npm i && bower i"
alias ls="ls -laG"
alias gclean="git clean -f -d"

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

makePatch() {
   local directory=$1
   local commit=$2
   git --git-dir=$directory.git format-patch -k -1 --stdout "$commit" | git am -3 -k
}

deleteTag() {
   git tag -d $1
   git push origin :refs/tags/$1
}

dockerBash() {
   docker exec -i -t $1 bash
}

clone () {
  repo
  git clone "git@github.kub.org:$1.git"
  cd "$1"
}

ge() {
  git remote -v | head -n 1 | awk -F "@" '{print $2}' | awk -F " " '{print $1}' | sed 's/:/\//g' | sed 's/.git$//g' | awk '{print "http://"$1}' | xargs open
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
