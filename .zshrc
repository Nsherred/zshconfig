export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$PATH:~/.config/.emacs.d/bin"
export PATH="$HOME/.emacs.d/bin:$PATH" export KUBECONFIG=$HOME/.kube/NA-West-kubeconfig.yml
export PATH="$PATH:$HOME/.local/bin"

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
export JAVA_HOME=(/usr/libexec/java_home -v 17)

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
alias ze="v $ZDOTDIR/.zshrc"
alias zs="source $ZDOTDIR/.zshrc"
alias nve="v ~/.config/nvim/init.vim" 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

eval "$(rtx activate zsh)"
