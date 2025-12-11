## oh my zsh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export ZSH="/Users/$(whoami)/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(httpie stripe deno brew git docker zsh-nvm)
source $ZSH/oh-my-zsh.sh
# DISABLE_MAGIC_FUNCTIONS="true"

## Misc
bindkey "\M-B\M- " magic-space # https://relativkreativ.at/articles/why-chaining-commands-with-pipes-in-mac-os-x-does-not-always-work

envs() {
	ENV_FILE=".env"
	if [ $# -gt 0 ]
	then
		ENV_FILE=".env.$1"
		echo "Using $ENV_FILE"
	fi
	export $(grep -v '^#' $ENV_FILE)
}

## psql

export PATH="/usr/local/opt/libpq/bin:$PATH"

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


## Git config

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

# Google Cloud
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi


export PATH="/Users/aabedraba/.deno/bin:$PATH"

# Created by `pipx` on 2024-10-25 16:14:34
export PATH="$PATH:/Users/aabedraba/.local/bin"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# bun completions
[ -s "/Users/aabedraba/.bun/_bun" ] && source "/Users/aabedraba/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/aabedraba/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
