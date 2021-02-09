# Dotfiles
- [Dotfiles](#dotfiles)
  - [Installation](#installation)
    - [Using curl](#using-curl)
    - [Using git](#using-git)
  - [Usage](#usage)
  - [Uninstall](#uninstall)
  - [Applications](#applications)
    - [dev](#dev)
    - [Browsers](#browsers)
    - [Utils](#utils)
    - [Misc](#misc)
  - [Alias](#alias)
  - [vscode extensions](#vscode-extensions)
  - [Helpful commands](#helpful-commands)
  
## Installation

### Using curl

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/herveGuigoz/dotfiles/master/install.sh)"
```

### Using git

```bash
# Clone dotfiles
cd ~/ && git clone https://github.com/herveGuigoz/dotfiles.git && cd ~/dotfiles
```


## Usage
```bash
cd ~/dotfiles && bash sync.sh
```

## Uninstall

```bash
bash ~/dotfiles/install.sh uninstall
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

- android-file-transfer
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

alias dotfiles-sync="bash ~/dotfiles/sync.sh"
alias mac-cleanup="/usr/local/opt/mac-cleanup/bin/mac-cleanup"

################################################
# MISC                                         #
################################################

alias ip='ipconfig getifaddr en0'
alias al="alias"
alias af="alias-finder"
```

## vscode extensions

- [One Dark Pro Theme](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme)
- [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code)
- [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
- [Dart Data Class Generator](https://marketplace.visualstudio.com/items?itemName=BendixMa.dart-data-class-generator)
- [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur)
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)
- [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
- [Markdown Preview Mermaid Support](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)
- [Mermaid Markdown Syntax Highlighting](https://marketplace.visualstudio.com/items?itemName=bpruitt-goddard.mermaid-markdown-syntax-highlighting)
- [Freezed](https://marketplace.visualstudio.com/items?itemName=blaxou.freezed)
- [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [Twig](https://marketplace.visualstudio.com/items?itemName=whatwedo.twig)

## Helpful commands

```bash
# Get wifi password.
wifi-password
```