#!/bin/bash

source "$CONFIG_DIR/colors.sh"

space=$1

if [ -z "$space" ]; then
    exit 0
fi

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

# list windows on this workspace (empty if none)
apps=$(aerospace list-windows --workspace "$space" 2>/dev/null)

# Show workspace only if it's focused OR has windows; hide empty non-focused ones
if [ "$space" = "$FOCUSED_WORKSPACE" ] || [ -n "$apps" ]; then
    sketchybar --set ws.$space drawing=on
else
    sketchybar --set ws.$space drawing=off
fi

# Style the focused workspace with the i3-like blue background
if [ "$space" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set ws.$space background.drawing=on \
                               background.color=$ACCENT_COLOR \
                               label.color=0xff000000 \
                               icon.color=0xff000000
else
    sketchybar --set ws.$space background.drawing=off \
                               label.color=$WHITE \
                               icon.color=$WHITE
fi
