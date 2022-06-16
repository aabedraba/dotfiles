## oh my zsh
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export ZSH="/Users/$(whoami)/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(yarn brew git terraform golang docker zsh-nvm kubectl minikube)
source $ZSH/oh-my-zsh.sh
# DISABLE_MAGIC_FUNCTIONS="true"

## Misc
bindkey "\M-B\M- " magic-space # https://relativkreativ.at/articles/why-chaining-commands-with-pipes-in-mac-os-x-does-not-always-work 

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

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

psg() {
  ps aux | grep "$@"
}

## Node

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias s="npm start"
alias n="node -r esm"

## Git config

alias check="hub pr checkout"
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
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}


## Kubernetes
alias tk="kubectl-testkube"
alias kc="kubectx"
alias kn="kubens"
alias kd="kubectl describe" 

export PATH="$PATH:/usr/local/istio-1.13.4/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aabedraba/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/aabedraba/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/aabedraba/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/aabedraba/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
