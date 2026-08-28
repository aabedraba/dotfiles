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

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Created by `pipx` on 2025-12-13 22:13:48
export PATH="$PATH:/Users/abdallah/.local/bin"

# Flutter 
export CHROME_EXECUTABLE="/Applications/Chromium.app/Contents/MacOS/Chromium"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/abdallah/.dart-cli-completion/zsh-config.zsh ]] && . /Users/abdallah/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH=$PATH:$HOME/fvm/default/bin
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=/opt/homebrew/share/google-cloud-sdk/bin:"$PATH"
export PATH=/usr/local/TinyTeX/bin/universal-darwin:"$PATH"
alias ap='pbpaste | xargs adb shell input text'
alias eap='adb shell input text "a@abedraba.com"'
alias eas="pnpm dlx eas-cli@latest"

# Flutter End

# Telemetry 

export NEXT_TELEMETRY_DISABLED=1
export DISABLE_TELEMETRY=1

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/Users/abdallah/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

export RESUMX_TELEMETRY=0
# nub node shim
export PATH="$HOME/.nub/node-shim:$PATH"

# nub shims
export PATH="$HOME/.nub/shims:$PATH"
source /Users/abdallah/.zsh_kraft_completion;

# unikraft
export KRAFTKIT_NO_CHECK_UPDATES=true
export KRAFTKIT_COLLECT_ANONYMOUS_TELEMETRY=true
source <(unikraft completion -c zsh)

# bun completions
[ -s "/Users/abdallah/.bun/_bun" ] && source "/Users/abdallah/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
