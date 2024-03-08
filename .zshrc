export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$PATH:~/.config/.emacs.d/bin"
export PATH="$HOME/.emacs.d/bin:$PATH" 
export PATH="$HOME/go/bin:$PATH"
export KUBECONFIG=$HOME/.kube/NA-West-kubeconfig.yml
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:~/istio-1.19.3/bin"
export PATH="/opt/homebrew/opt/openssl@3.2/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

# Disabling to stop zsh from breaking iterm2 titles
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history zsh-autosuggestions zsh-syntax-highlighting gradle-completion)

source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/.secrets
source ~/.config/zsh/.projects

export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config
# export JAVA_HOME=(/usr/libexec/java_home -v 17)

export DOCKER_HOST="unix://${HOME}/.colima/m2/docker.sock"
# Overrides
alias cat=bat
alias ls=exa

alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# Git Shortcuts
alias gto="git checkout "
alias gta="git add "
alias gti="git commit -m "
alias gtu="git remote prune origin && git pull --all && git submodule update --remote --merge"
alias gtp="git push "
alias gba="git branch -a "
alias gbd="git branch -d "
alias gts="git status " 
alias clonesub="git clone --recurse-submodules -j8"
alias gsm="git submodule foreach --recursive 'echo \"aborting potential merges for (\${name})\"; git merge --abort || :; echo \"getting branch for (\${name})\"; SMBRANCH=\$(git config -f \${toplevel}/.gitmodules --get submodule.\${name}.branch); echo \"checking out (\${SMBRANCH})\"; git checkout \${SMBRANCH} || :; git pull; :'"
alias gtdo='git branch -vv | grep "gone" | awk "{print $1}" > /tmp/merged-branches && vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches'
alias gtc="git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' > /tmp/merged-branches && vi /tmp/merged-branches && xargs git branch -d < /tmp/merged-branches"
alias c="clear && printf '\e[3J'"
# Helper Aliases
alias mongostop="mongo admin --eval 'db.shutdownServer()'"
alias web="python -m SimpleHTTPServer 8000 & open 'http://localhost:8000' && fg"
alias l="exa -hal"

# Postgrest Test setup
export PSQLTEST_CONNECTION=jdbc:postgresql://localhost:5432
export PSQLTEST_USER="$(whoami)"

# Fix Terminal Colors
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# ZSH Helpers
alias ze="v $ZDOTDIR"
alias zs="source $ZDOTDIR/.zshrc"
alias nve="cd ~/.config/nvim/lua/user && v ." 

# export LD_LIBRARY_PATH=$(brew --prefix openssl)/lib
# export CPATH=$(brew --prefix openssl)/include
# export PKG_CONFIG_PATH=$(brew --prefix openssl)/lib/pkgconfig

export LDFLAGS="-L/opt/homebrew/opt/openssl@3.2/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3.2/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3.2/lib/pkgconfig"

alias ssh='env TERM=xterm-256color ssh'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

eval "$(rtx activate zsh)"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nsherred/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nsherred/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nsherred/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nsherred/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

