echo "Install home brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Install brew cask"
brew tap homebrew/cask

# git
echo "Install git"
brew install git

# terminal
echo "Install terminal stuff"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew cask install iterm2
sed -i -e 's/plugins=(git)/plugins=(git flutter alias-finder docker)/g' ~/.zshrc

# Dev tools
brew install node
brew install yarn
brew install composer
brew cask install docker

# Misc
brew cask install brave-browser
brew cask install microsoft-teams
brew cask install insomnia
brew cask install keepassxc
brew cask install appcleaner
