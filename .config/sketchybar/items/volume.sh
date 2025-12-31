#!/bin/bash

sketchybar --add item volume left \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                        icon.color=$BLUE \
                        label.color=$BLUE \
                        background.drawing=off \
           --subscribe volume volume_change
