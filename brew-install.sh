echo "Install home brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Install brew cask"
brew tap homebrew/cask

echo "Install git"
brew install git

echo "Install oh my zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Dev tools
echo "Install dev tools..."

brew cask install iterm2
brew install docker


