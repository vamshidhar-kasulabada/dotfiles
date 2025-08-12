##### Adding Custom Prompt #####
# PROMPT="%U%F{yellow}%1~%f%u %F{blue}$%f "


##### OH-MY-ZSH Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions copypath jsontools web-search)
source $ZSH/oh-my-zsh.sh


##### PATH #####

# language servers
# export PATH="/opt/lsp/bin:$PATH"


# Adding HomeBrew to Path
# export PATH="/opt/homebrew/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# User binaries
export PATH="$HOME/.bin:$PATH"

##### NVM Configuration #####
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Adding Mongodb to Path
# export PATH="$PATH:/usr/local/mongodb/aarch64-6.0.3/bin"
# mongodb is now installed with brew


##### Environment Variable #####

# Setting Mono Path
export FrameworkPathOverride=/Library/Frameworks/Mono.framework/Versions/Current/lib/mono/4.7.2-api


#Setting JAVA_HOME Path

# Get the latest Java version and set JAVA_HOME
# prefred_java_version=17
# latest_prefred_version=$(lua ~/.bin/java.lua $prefred_java_version)
# export JAVA_HOME="/opt/homebrew/Cellar/openjdk@17/$latest_prefred_version"


# source ~/.bin/java_home
export JAVA_HOME="/opt/jvm/amazon-corretto-17.jdk/Contents/Home"
export JAVA_21="$HOME/opt/java/amazon-corretto-21/Contents/Home/bin/java"
export GO111MODULE=on


# Add Visual Studio Code (code)
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"



##### functions #####
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

##### alias's #####

alias llvm="/opt/homebrew/Cellar/llvm@15/15.0.7/bin/clang++"
# alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias src="source ~/.zshrc"
alias cdls="source cdls"

##### Completions #####

# Load Angular CLI autocompletion.
# source <(ng completion script)

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# zoxide
eval "$(zoxide init --cmd cd  zsh)"
