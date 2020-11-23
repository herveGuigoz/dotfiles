#!/bin/bash

################################################
# Install native apps                          #
################################################

brew tap homebrew/cask

# dev
brew install git

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew cask install iterm2
brew install zsh-autosuggestions
sed -i -e 's/plugins=(git)/plugins=(git zsh-autosuggestions flutter alias-finder docker)/g' ~/.zshrc

brew cask install docker
brew tap dart-lang/dart
brew install dart
pub global activate fvm
brew install node
brew install yarn
brew install composer
brew cask install android-platform-tools
brew cask install android-studio
brew cask install visual-studio-code
brew cask install insomnia
brew install lcov

# browsers
brew cask install brave-browser

# Misc
brew install scrcpy
brew cask install spotify
brew cask install keepassxc
brew cask install appcleaner
brew cask install windscribe
brew cask install lulu
brew cask install inkscape
brew cask install discord
brew install wifi-password

# Remove outdated versions from the cellar
brew cleanup