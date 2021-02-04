#!/usr/bin/env bash

# execute command
# ----------------------------------
# curl -s https://raw.githubusercontent.com/herveGuigoz/dotfiles/master/install.sh | /bin/bash


# Utils
# ----------------------------------
ask_for_confirmation() {
    print_question "$1 (y/n) "
    read -n 1
    printf "\n"
}

answer_is_yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
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

print_info() {
    # Print output in purple
    printf "\e[0;35m  [!] $1\e[0m\n"
}

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

cmd_exists() {
    [ -x "$(command -v "$1")" ]
}

execute() {
    $1 &> /dev/null
    print_result $? "${2:-$1}"
}
# ----------------------------------

clone-dotfiles() {
    cd ~/ && git clone https://github.com/herveGuigoz/dotfiles.git && cd ~/dotfiles
}

install-homebrew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

install-git() {
    brew install git
}


function install() {
    if cmd_exists git; then
      print_info "Cloning repository"
      execute clone-dotfiles "clonning dotfiles to ~/dotfiles"
    else
      ask_for_confirmation 'git not installed. Would you like to install homebrew and git ?'
      if answer_is_yes; then
        execute install-homebrew "homebrew installation"
        execute install-git "Git installation"
        execute clone-dotfiles "clonning dotfiles to ~/dotfiles"
      fi
    fi
}

function uninstall() {
    print_info "Uninstall Dotfiles"
    sudo rm ~/dotfiles
}

case $1 in
    uninstall)
        uninstall
		exit
        ;;
    update)
        install
        exit
        ;;
    *)
		install
		exit
        ;;
esac