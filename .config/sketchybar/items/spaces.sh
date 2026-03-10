#!/bin/bash

# Remove existing spaces
sketchybar --remove '/space\..*/'

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space."$sid" center                              \
             --subscribe space."$sid" aerospace_workspace_change         \
             --set space.$sid                                            \
                   icon=$sid                                             \
                   icon.drawing=on                                       \
                   icon.font="FiraCode Nerd Font:Bold:16.0"              \
                   label.font="FiraCode Nerd Font:Semibold:14.0"         \
                   label.padding_right=0                                 \
                   click_script="aerospace workspace $sid"               \
                   script="$PLUGIN_DIR/aerospacer.sh $sid"
done
