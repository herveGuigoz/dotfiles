# Dotfiles
  - [Installation](#installation)
  - [Applications](#applications)
    - [dev](#dev)
    - [Browsers](#browsers)
    - [Utils](#utils)
    - [Misc](#misc)
  - [Alias](#alias)
  - [Helpful commands](#helpful-commands)

## Installation

```bash
# Clone dotfiles
cd ~/ && git clone https://github.com/herveGuigoz/dotfiles.git

# Run installation
cd ~/dotfiles && bash sync.sh
```

## Applications

### dev

- git
- Dart
- android-platform-tools
- android-studio
- docker
- insomnia
- phpstorm
- visual-studio-code
- composer
- go
- mkcert
- node
- lcov
- php
- scrcpy
- yarn

### Browsers

- brave-browser
- firefox
- google-chrome

### Utils

- ffmpeg
- zsh-autosuggestions
- imagemagick
- thefuck
- wifi-password

### Misc

- discord
- microsoft-teams
- spotify
- openoffice
- lulu
- keepassxc
- inkscape
- appcleaner
- clean-me
- iterm2
- [mac-cleanup](https://github.com/fwartner/homebrew-mac-cleanup)
- windscribe

## Alias

```bash
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
```

## Helpful commands

```bash
# Get wifi password.
wifi-password
```