#!/bin/bash

################################################
# UTILS                                        #
################################################

answer_is_yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}

ask() {
    print_question "$1"
    read
}

ask_for_confirmation() {
    print_question "$1 (y/n) "
    read -n 1
    printf "\n"
}

ask_for_sudo() {

    # Ask for the administrator password upfront
    sudo -v

    # Update existing `sudo` time stamp until this script has finished
    # https://gist.github.com/cowboy/3118588
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done &> /dev/null &

}

cmd_exists() {
    [ -x "$(command -v "$1")" ] \
        && printf 0 \
        || printf 1
}

execute() {
    $1 &> /dev/null
    print_result $? "${2:-$1}"
}

get_answer() {
    printf "$REPLY"
}

get_os() {

    declare -r OS_NAME="$(uname -s)"
    local os=""

    if [ "$OS_NAME" == "Darwin" ]; then
        os="osx"
    elif [ "$OS_NAME" == "Linux" ] && [ -e "/etc/lsb-release" ]; then
        os="ubuntu"
    fi

    printf "%s" "$os"

}

is_git_repository() {
    [ "$(git rev-parse &>/dev/null; printf $?)" -eq 0 ] \
        && return 0 \
        || return 1
}

mkd() {
    if [ -n "$1" ]; then
        if [ -e "$1" ]; then
            if [ ! -d "$1" ]; then
                print_error "$1 - a file with the same name already exists!"
            else
                print_success "$1"
            fi
        else
            execute "mkdir -p $1" "$1"
        fi
    fi
}

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_info() {
    # Print output in purple
    printf "\e[0;35m  [!] $1\e[0m\n"
}

print_question() {
    # Print output in yellow
    printf "\e[0;33m  [?] $1\e[0m"
}

print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    [ "$3" == "true" ] && [ $1 -ne 0 ] \
        && exit
}

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] $1\e[0m\n"
}

################################################
# MAIN                                         #
################################################

main() {
    # Homebrew
    if ! command -v brew >/dev/null 2>&1; then
        print_info "Installing Brew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        print_success "Brew installed."
        ask_for_confirmation "do you want to cask all package from brew-cask.sh ?"
        if answer_is_yes; then
            print_info "Installing applications..."
            sh ./brew-cask.sh
            print_success "Applications installed."
        fi
    else
        print_success "Brew already installed."
        ask_for_confirmation "do you want to update brew packages ?"
        if answer_is_yes; then
            print_info "Updating Brew..."
            brew update
            print_info "Upgrading Packages..."
            brew upgrade
            print_info "Removing outdated versions from the cellar"
            brew cleanup
            print_success "Brew is up to date."
        fi
    fi

    # Git
    if [ -f ./git/.gitconfig ]; then
        ask_for_confirmation "do you want to override .gitconfig ?"
        if answer_is_yes; then
            cp ./git/.gitconfig ~/.gitconfig
            print_success ".gitconfig is up to date."
        else
            print_info 'gitconfig is omitted'
        fi
    else
        print_error './git/.gitconfig file doesnt exist, gitconfig is omitted.'
    fi
    if [ -f ./git/commit_types ]; then
        chmod -x ./git/commit_types
    fi

    # Vs Code Extensions
    if [ -f ./vs-code-extensions.txt ]; then
        ask_for_confirmation "do you want to install vs code extensions ?"
        if answer_is_yes; then
            extensions=$(cat ./vs-code-extensions.txt)
            for ext in $extensions; do
                code --install-extension "$ext" --force
            done
            print_success 'vs code extensions installed.'
        else
            print_info 'vs code extensions is omitted.'
        fi
    else
        print_error './ide/vs-code/extensions.txt file doesnt exist, vs code extensions is omitted.'
    fi

    # Zsh
    if [ -f ./.zshrc ]; then
        ask_for_confirmation "do you want to update .zsh config ?"
        if answer_is_yes; then
            cp ./.zshrc ~/.zshrc
            source ~/.zshrc
            print_success '.zsh configuration file is up to date.'
        fi
    fi
}

main
