echo "Install home brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Install brew cask"
brew tap homebrew/cask

# Git
echo "Install git"
brew install git

# Terminal
echo "Install terminal stuff"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew cask install iterm2
brew install zsh-autosuggestions
sed -i -e 's/plugins=(git)/plugins=(git zsh-autosuggestions flutter alias-finder docker)/g' ~/.zshrc

# Dev tools
brew install node
brew install yarn
brew install composer
brew cask install docker
brew tap dart-lang/dart
brew install dart
pub global activate fvm
brew cask install android-platform-tools

brew cask install android-studio
brew cask install visual-studio-code
brew cask install insomnia

# Misc
brew install scrcpy
brew cask install brave-browser
brew cask install keepassxc
brew cask install appcleaner
brew cask install windscribe
brew cask install lulu
brew cask install inkscape
brew cask install discord
# brew cask install sloth # https://github.com/sveinbjornt/Sloth

