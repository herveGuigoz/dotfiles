#!/bin/bash

source ./scripts/utils.sh

install-homebrew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

brew_tap_install() {
    comm -23 \
		<(sort ~/dotfiles/homebrew/brew-tap.txt) \
		<(brew tap) |
		xargs brew tap
}

brew_packages_install() {
    comm -23 \
		<(sort ~/dotfiles/homebrew/brew.txt) \
		<(brew ls) |
		xargs brew install
}

brew_cask_install() {
	comm -23 \
		<(sort ~/dotfiles/homebrew/brew-cask.txt) \
		<(brew ls --cask) |
		xargs cask install
}

install-ohmyzsh() {
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_zsh-autosuggestions() {
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    sed -i -e 's/plugins=(git)/plugins=(git zsh-autosuggestions flutter alias-finder docker)/g' ~/.zshrc
}

update-vscode-extension() {
    sh -c "bash ~/dotfiles/ide/vs-code/install-vscode-extensions.sh"
}

update-zshrc-config() {
    cp ./.zshrc ~/.zshrc 
    source ~/.zshrc
}

update-gitconfig() {
    cp ./git/.gitconfig ~/.gitconfig
}



# MAIN
# ----------------------------------

main() {
    # xcode
    if ! command -v xcode-select >/dev/null 2>&1; then
		print_info "Installing xcode CLI"
		xcode-select —-install
	fi
    # Check for Homebrew to be present, install if it's missing
    if test ! $(which brew); then
        print_info "Installing Brew..."
        execute install-homebrew "Brew installed."
        ask_for_confirmation "do you want to install all packages ?"
        if answer_is_yes; then
            execute install_brew_packages "Applications installed."
        fi
    else
        print_success "Brew already installed."
        ask_for_confirmation "do you want to update brew packages ?"
        if answer_is_yes; then
            print_info "Updating Brew..."
            brew update
            print_info "Removing outdated versions from the cellar"
            brew cleanup
        fi
        ask_for_confirmation "Check for new taps from /homebrew/brew-tap.txt and install them ?"
        if answer_is_yes; then
            execute brew_tap_install "brew taps installed"
        fi
        ask_for_confirmation "Check for new package from /homebrew/brew.txt and install them ?"
        if answer_is_yes; then
            execute brew_packages_install 'brew packages installed'
        fi
        ask_for_confirmation "Check for new casks from /homebrew/brew-cask.txt and install them ?"
        if answer_is_yes; then
            execute brew_cask_install 'brew casks installed'
        fi
        print_success "Brew is up to date."
    fi

    # Git
    if [ -f ~/dotfiles/git/.gitconfig ] && [ -f ~/.gitconfig ]; then
        ask_for_confirmation "do you want to override .gitconfig ?"
        if answer_is_yes; then
            execute update-gitconfig ".gitconfig is up to date."
        else
            print_info 'gitconfig is omitted'
        fi
    else
        print_error '.gitconfig file doesnt exist, gitconfig is omitted.'
    fi
    if [ -f ./git/commit_types ]; then
        chmod -x ./git/commit_types
    fi

    # Vs Code Extensions
    if cmd_exists code; then
        ask_for_confirmation "do you want to install or update vs code extensions present in /ide/vs-code/vs-code-extensions.txt ?"
        if answer_is_yes; then
            execute update-vscode-extension "vs code extensions installation."
        else
            print_info 'vs code extensions is omitted.'
        fi
    fi
    
    # Zsh
    if [ -f ~/.zshrc ]; then
        if ! [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
            ask_for_confirmation "Do you want to install zsh-autosuggestions ?"
            if answer_is_yes; then
                execute install_zsh-autosuggestions "zsh-autosuggestions installed"
            fi
        fi
        ask_for_confirmation "do you want to update .zshrc config ?"
        if answer_is_yes; then
            execute update-zshrc-config ".zsh configuration file is up to date."
        else
            print_info '.zshrc update is omitted.'
        fi
    else
        ask_for_confirmation "Do you want to install ohmyzsh with zsh-autosuggestions?"
        if answer_is_yes; then
            execute install-ohmyzsh "ohmyzsh installed"
            execute install_zsh-autosuggestions "zsh-autosuggestions installed"
        fi
    fi

    if [ -f /usr/local/opt/mac-cleanup/bin/mac-cleanup ]; then
        ask_for_confirmation "do you want to run mac-cleanup ?"
        if answer_is_yes; then
            /usr/local/opt/mac-cleanup/bin/mac-cleanup
            print_success 'Your mac is up to date !'
        else
            print_info 'mac-cleanup is omitted.'
        fi
    fi
}

main
