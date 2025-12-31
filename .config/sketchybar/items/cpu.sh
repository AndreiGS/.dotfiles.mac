#!/bin/bash

sketchybar --add item cpu left \
           --set cpu  update_freq=2 \
                      icon=  \
                      icon.color=$RED \
                      label.color=$RED \
                      script="$PLUGIN_DIR/cpu.sh" \
                      background.drawing=off
