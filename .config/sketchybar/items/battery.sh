#!/bin/bash

sketchybar --add item battery left \
           --set battery update_freq=120 \
                         script="$PLUGIN_DIR/battery.sh" \
                         icon.color=$GREEN \
                         label.color=$GREEN \
                         background.drawing=off \
           --subscribe battery system_woke power_source_change
