## oh my zsh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
export ZSH="/Users/$(whoami)/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(httpie stripe deno brew git docker)
source $ZSH/oh-my-zsh.sh
# DISABLE_MAGIC_FUNCTIONS="true"

## Misc
bindkey "\M-B\M- " magic-space # https://relativkreativ.at/articles/why-chaining-commands-with-pipes-in-mac-os-x-does-not-always-work

## Shortcuts

alias hg='history | grep'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

envs() {
	ENV_FILE=".env"
	if [ $# -gt 0 ]
	then
		ENV_FILE=".env.$1"
		echo "Using $ENV_FILE"
	fi
	export $(grep -v '^#' $ENV_FILE)
}

psg() {
  ps aux | grep "$@"
}

alias check="gh pr checkout"
alias fp="git push -f"
alias amend="git commit --amend && fp"
alias master="git checkout master && git pull"
alias main="git checkout main && git pull"
alias st="git stash"
alias sd="git stash && git stash drop"
alias pr="gh pr create"
alias p="git push"
alias show="gh pr view --web"
alias b="gh repo view --web"
nb () {
    git checkout -b "$@"
}
m() {
    git commit -m "$@" && git push
}
deletemerged() {
    git branch --merged master | egrep -v '^\s*\*?\s*master$' | xargs git branch -d
}

## Aplication specific config 

# Deno
export PATH="/Users/aabedraba/.deno/bin:$PATH"

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi
