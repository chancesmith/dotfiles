# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias code="code ."
alias c="code ."

## lifeway
alias yw="yarn workspace"
alias yws="yarn workspace mobile start"
alias yyws="yarn && yarn workspace mobile start"
alias lwd="cd ~/wip/lifeway-discipleship"

# source ~/.zshrc-import
## location shortcuts
alias work='cd ~/wip/'
alias wip='cd ~/wip/'
alias home='cd ~'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'

## fix and faster open directory ##
alias open.='open .'
alias o.='open .'

alias speed='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
alias speedtest='/usr/bin/open -a "/Applications/Google Chrome.app" "http://www.speedtest.net/"'

## git
alias gs='git status -s'
alias ga='git add .'
alias gaa='git add --all'
# alias gc='git commit -m'
alias gca='git commit --amend -m'
alias gl='git pull'
alias glg='git log --graph --abbrev-commit --decorate --date=relative --all'
alias gfo='git fetch origin'
alias glm='git fetch origin'
alias gp='git push'
alias gco='git checkout'
alias gch='git checkout'
alias gk='git checkout'
alias gkm='git checkout main'
alias gkma='git checkout main'
alias gkb='git checkout -b'
alias gpom="git pull origin main"
alias gd='git diff | mate'
alias gb='git branch'
alias gba='git branch -a'
alias del='git branch -d'
alias gr='git remote'
alias gcl='git clone'
# just in case
alias got='git '
alias get='git '
alias gin='touch .gitignore && echo "node_modules/" >> .gitignore && git rm -r --cached node_modules ; git status'
alias gr='git reset'
## zips up uncommited changes
alias gitzip='zip modified.zip $(git status -s | egrep "M|A|AM" | rev | cut -d" " -f1 | rev)'

## yarn
alias y='yarn'
alias ys='yarn start'
alias yys='yarn && yarn start'
alias yd='yarn dev'
alias yyd='yarn && yarn dev'
alias yd='yarn dev'
alias yb='yarn build'
alias yt='yarn test'
alias ytc='yarn test --coverage'
alias ya='yarn add'
alias yad='yarn add --dev'
alias ycc='yarn cache clean'
alias yw="yarn workspace"

## yarn - update all packages and update package.json
alias yup='ncu --upgrade --interactive && yarn upgrade'

## adds simpler Vi
alias v="vi"

## node
alias rmnode='rm -rf ./node_modules'
alias nvmrc='node -v > .nvmrc'

## docker
alias d='docker'
## docker-compose
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcb='docker compose build'
alias dcdu='docker compose down && docker-compose build && docker-compose up'
alias dcp='docker compose down && git pull && docker-compose build && docker-compose up'
# backend - docker helpers
alias dcbuild='dc stop api && dc build && dc up -d api'

## terminal auto fixing (too crude for me)
eval $(thefuck --alias)
alias please='fuck'
alias pls='fuck'

## github cli
alias pr='gh pr create'
## END sourcing zshrc-import

alias gec="npx git-emoji-commit"

# auto node version jumping
eval "$(fnm env --use-on-cd)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH=$PATH:$HOME/.maestro/bin

# Add android sdk and platform tools
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export ANDROID_AVD_HOME=$HOME/.android/avd
PATH="$PATH:$ANDROID_HOME/platform-tools"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/Users/chance.smith/.bun/_bun" ] && source "/Users/chance.smith/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

PATH=~/.console-ninja/.bin:$PATHeval "$(~/.local/bin/mise activate zsh)"
eval "$(/opt/homebrew/bin/mise activate zsh)"
