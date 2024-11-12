##### Adding Custom Prompt #####
# PROMPT="%U%F{yellow}%1~%f%u %F{blue}$%f "


##### OH-MY-ZSH Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions copypath jsontools web-search)
source $ZSH/oh-my-zsh.sh

##### NVM Configuration #####
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


##### PATH #####


# Adding HomeBrew to Path
export PATH="/opt/homebrew/bin:$PATH"

# User binaries
export PATH="$HOME/.bin:$PATH"

# Adding Mongodb to Path
# export PATH="$PATH:/usr/local/mongodb/aarch64-6.0.3/bin"
# mongodb is now installed with brew


##### Environment Variable #####
#Setting JAVA_HOME Path
export JAVA_HOME="/opt/homebrew/Cellar/openjdk@17/17.0.13"

# Add Visual Studio Code (code)
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export XDG_DATA_HOME="$HOME/.local/share"



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
source <(ng completion script)

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"
