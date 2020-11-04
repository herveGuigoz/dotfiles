echo "Install home brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Install brew cask"
brew tap homebrew/cask

# git
echo "Install git"
brew install git

# terminal
echo "Upgrade terminal"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew cask install iterm2

# Dev tools
brew install node
brew install yarn
brew install composer
brew cask install docker

# Other
brew cask install microsoft-teams
