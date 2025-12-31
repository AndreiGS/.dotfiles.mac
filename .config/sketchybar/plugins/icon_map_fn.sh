#!/bin/bash

# Convert input to lowercase for case-insensitive matching
app_name=$(echo "$1" | tr '[:upper:]' '[:lower:]')

# Define the icon map
case "$app_name" in
    "terminal" | "kitty" | "alacritty" | "iterm2" | "ghostty")
        icon=""
        ;;
    "code" | "vscode" | "vscodium" | "intellij idea" | "android studio" | "zed")
        icon=""
        ;;
    "google chrome" | "brave browser" | "safari" | "firefox" | "arc" | "zen browser" | "zen")
        icon=""
        ;;
    "finder")
        icon=""
        ;;
    "music" | "spotify")
        icon=""
        ;;
    "discord" | "slack")
        icon=""
        ;;
    "mail" | "thunderbird" | "microsoft outlook")
        icon=""
        ;;
    "calendar")
        icon=""
        ;;
    "system settings" | "system preferences")
        icon=""
        ;;
    "antigravity")
        icon=""
        ;;
    *)
        icon="" # Default window icon
        ;;
esac

echo "$icon"