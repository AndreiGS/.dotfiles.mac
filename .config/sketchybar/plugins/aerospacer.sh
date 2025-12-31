#!/bin/bash

source "$CONFIG_DIR/colors.sh"

if [ -z "$FOCUSED_WORKSPACE" ]; then
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

# $1 is the workspace id passed from the script config
space=$1

# Get apps in this workspace
apps=$(aerospace list-windows --format %{app-name} --workspace "$space" 2>/dev/null)

icon_strip=""
if [ "${apps}" != "" ]; then
  while read -r app
  do
    # Call the icon map
    icon=$("$CONFIG_DIR/plugins/icon_map_fn.sh" "$app")
    icon_strip+="$icon  "
  done <<< "${apps}"
  icon_strip=${icon_strip%  }
else
  icon_strip="—"
fi

# Highlight focused workspace
if [ "$space" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on \
                           background.color=$ACCENT_COLOR \
                           background.height=25 \
                           background.y_offset=0 \
                           label.drawing=on \
                           label="$icon_strip" \
                           label.color=$BAR_COLOR \
                           label.padding_left=4 \
                           label.padding_right=10 \
                           label.y_offset=0 \
                           icon.drawing=on \
                           icon.color=$BAR_COLOR \
                           icon.padding_left=10 \
                           icon.padding_right=4 \
                           icon.y_offset=0
else
    sketchybar --set $NAME background.drawing=off \
                           background.height=20 \
                           background.y_offset=0 \
                           label.drawing=on \
                           label="$icon_strip" \
                           label.color=$WHITE \
                           label.padding_left=4 \
                           label.padding_right=10 \
                           label.y_offset=0 \
                           icon.drawing=on \
                           icon.color=$WHITE \
                           icon.padding_left=10 \
                           icon.padding_right=4 \
                           icon.y_offset=0
fi
