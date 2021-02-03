# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions flutter alias-finder docker)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

################################################
# BASH                                         #
################################################

alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias dev="cd ~/dev"

alias chmox='chmod -x'
alias c="clear"

################################################
# TYPOS                                        #
################################################

alias brwe='brew'
alias gti="git"

################################################
# ZSH                                          #
################################################

alias zshconfig="vim ~/.zshrc"
alias sourcezsh="source ~/.zshrc"

################################################
# GIT                                          #
################################################

alias gmaster="git checkout master"
alias gca="git commit --amend"

alias changelogs='git log --pretty=format:"[%h] %s"'

alias ct='sh ~/dotfiles/git/commit_types'

################################################
# DOCKER                                       #
################################################

alias docker-rm-all='docker rm -vf $(docker ps -aq)'
alias dc="docker-compose"
alias dcrmc="docker-compose exec php bin/console c:c"
alias rmc="rm -rf var/cache"

################################################
# FLUTTER                                      #
################################################

export PATH="$PATH:/Users/$USER/fvm/default/bin:/Users/$USER/.pub-cache/bin"

################################################
# SHORTCUTS                                    #
################################################

alias g="git"
alias v="vim"

################################################
# MAC CLEANUP                                  #
################################################

alias mac-cleanup="/usr/local/opt/mac-cleanup/bin/mac-cleanup"

################################################
# MISC                                         #
################################################

alias ip='ipconfig getifaddr en0'
alias al="alias"
alias af="alias-finder"

export PATH="/usr/local/sbin:$PATH"
