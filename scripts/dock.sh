#!/usr/bin/env bash
set -e

# Remove all default apps from the Dock
# Requires dockutil: brew install dockutil
if ! command -v dockutil &>/dev/null; then
  echo "dockutil not found, installing..."
  brew install dockutil
fi

echo "Removing all apps from Dock..."
dockutil --remove all --no-restart

# Add desired apps to Dock
apps=(
  "/Applications/Firefox.app"
  "/Applications/Obsidian.app"
  "/Applications/GitHub Desktop.app"
  "/Applications/Visual Studio Code.app"
  "/Applications/Ghostty.app"
)

for app in "${apps[@]}"; do
  if [ -d "$app" ]; then
    dockutil --add "$app" --no-restart
  else
    echo "$app not found, skipping."
  fi
done

# Restart Dock to apply changes
killall Dock

echo "Dock setup complete."
