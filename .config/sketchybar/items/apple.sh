#!/bin/bash

POPUP_OFF='sketchybar --set apple.logo popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

sketchybar --add item apple.logo left \
           --set apple.logo icon= \
                            icon.font="FiraCode Nerd Font:Regular:16.0" \
                            icon.color=$WHITE \
                            label.drawing=off \
                            click_script="$POPUP_CLICK_SCRIPT" \
                            popup.background.border_width=2 \
                            popup.background.corner_radius=5 \
                            popup.background.border_color=$WHITE \
                            popup.background.color=$BAR_COLOR \
                            popup.blur_radius=20 \
                                                 \
           --add item apple.prefs popup.apple.logo \
           --set apple.prefs icon= \
                             label="Preferences" \
                             click_script="open -a 'System Preferences'; $POPUP_OFF" \
                                                 \
           --add item apple.activity popup.apple.logo \
           --set apple.activity icon= \
                                label="Activity" \
                                click_script="open -a 'Activity Monitor'; $POPUP_OFF" \
                                                 \
           --add item apple.lock popup.apple.logo \
           --set apple.lock icon= \
                            label="Lock Screen" \
                            click_script="pmset displaysleepnow; $POPUP_OFF"
