#!/usr/bin/env bash
set -e

echo "--> Homebrew"

if ! command -v brew &>/dev/null; then
  echo "    Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for the rest of this script
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "    Homebrew already installed, updating..."
  brew update
fi

echo "    Installing packages from Brewfile..."
brew bundle --file="$(dirname "$0")/../Brewfile"

echo "    Done."
