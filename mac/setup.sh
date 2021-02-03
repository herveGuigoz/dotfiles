#!/bin/bash
# inspired by https://github.com/StefanScherer/dotfiles/blob/main/setup-mac

set_defaults() {
  # Save screenshots to the desktop
	defaults write com.apple.screencapture location -string "${HOME}/Desktop"

	# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
	defaults write com.apple.screencapture type -string "png"
}

set_defaults