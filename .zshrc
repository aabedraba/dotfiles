## oh my zsh
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export ZSH="/Users/$(whoami)/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-nvm)
source $ZSH/oh-my-zsh.sh
# DISABLE_MAGIC_FUNCTIONS="true"

## Misc
bindkey "\M-B\M- " magic-space # https://relativkreativ.at/articles/why-chaining-commands-with-pipes-in-mac-os-x-does-not-always-work 
# export EDITOR=vim
# Add Export envs for .env variable
envs () {
	ENV_FILE=".env"
	if [ $# -gt 0 ]
	then
		ENV_FILE=".env-$1"
	fi
	export $(grep -v '^#' $ENV_FILE)
}
alias hg='history | grep'
eval "$(jump shell)"

# Google Cloud
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi

## Start tmux
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

export PATH=$PATH:"/opt/toit/"
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=$PATH:"/Users/aabedraba/github/aabedraba/dotfiles/automate"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c="code ."
psg() {
  ps aux | grep "$@"
}

## Flutter
export PATH="$PATH:/Users/aabedraba/github/flutter/bin"

## Node

alias s="npm start"
alias n="node -r esm"
alias nn="npx nodemon -r esm"
alias tsn="npx ts-node -r esm"
alias migratedev="npx prisma migrate dev --schema src/prisma/schema.prisma"
alias migrateprod="npx prisma migrate deploy --schema src/prisma/schema.prisma"
alias tc="npx tsc --watch"
alias jest="npm run test -- --watch"
alias studio="npx prisma studio --schema src/prisma/schema.prisma"
ndb() { #next dev build
    rm -rf dist
    echo "Building files..."
    npx tsc
    echo "Finished building project"
    npm run copy
    echo "Generating types"
    npm run generate
    echo "Building next"
    npm run next-build
}

## Git config

alias check="hub pr checkout"
alias hub="gh"
alias fp="git push -f"
alias amend="git commit --amend && fp"
alias master="git checkout master && git pull"
alias main="git checkout main && git pull" 
alias st="git stash"
alias sd="git stash && git stash drop"
alias stat="git status"
alias prk="hub pr create -r kevinsimper && show"
alias prj="hub pr create -r jho-gm && show"
alias prc="hub pr create -r cecastosic && show" 
alias prm="hub pr create -r manuhortet && show"
alias pr="hub pr create"
alias p="git push"
alias prune="git fetch --prune"
alias show="hub pr view --web"
alias draft="hub pr create -d"
alias b="hub repo view --web"
stp () {
    git stash
    git checkout "$@"
    git stash pop
}
nb () {
    git checkout -b "$@"
}
m() {
    git commit -m "$@" && git push
}
setupstream() {
    git branch -u "origin/$(git branch --show-current)"
}
deletemerged() {
    git branch --merged master | egrep -v '^\s*\*?\s*master$' | xargs git branch -d
}
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

export PATH="/usr/local/homebrew/opt/mysql-client/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
