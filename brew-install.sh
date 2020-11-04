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
brew install zsh-autosuggestions
sed -i -e 's/plugins=(git)/plugins=(git zsh-autosuggestions flutter alias-finder docker)/g' ~/.zshrc

# Aliases
echo '# zsh' >>~/.zshrc
echo "alias zshconfig='vim ~/.zshrc'" >>~/.zshrc
echo "alias sourcezsh='source ~/.zshrc'" >>~/.zshrc
echo "# Common" >>~/.zshrc
echo "alias c='clear'" >>~/.zshrc
echo "# Git" >>~/.zshrc
echo "alias glh='git pull origin HEAD'" >>~/.zshrc
echo '# Prevent common error' >>~/.zshrc
echo "alias gti='git'" >>~/.zshrc
echo "# Docker compose" >>~/.zshrc
echo "alias dc='docker-compose'" >>~/.zshrc
echo "alias dcrmc='docker-compose exec php bin/console c:c'" >>~/.zshrc
echo "alias rmc='rm -rf var/cache'" >>~/.zshrc
echo '# Aliase' >>~/.zshrc
echo "alias al='alias'" >>~/.zshrc
echo "alias af='alias-finder'" >>~/.zshrc

source ~/.zshrc

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
