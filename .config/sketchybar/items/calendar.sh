#!/bin/bash

# Clear existing popup items if any
sketchybar --remove '/calendar\.row\..*/'
# Set popup.drawing=toggle to enable. Does not look right yet
sketchybar --add item calendar right \
           --set calendar icon=  \
                          update_freq=30 \
                          icon.color=$YELLOW \
                          label.color=$YELLOW \
                          script="$PLUGIN_DIR/calendar.sh" \
                          click_script="sketchybar --set calendar popup.drawing=off" \
                          background.drawing=off \
                          popup.background.border_width=2 \
                          popup.background.corner_radius=5 \
                          popup.background.border_color=$WHITE \
                          popup.background.color=$BAR_COLOR \
                          popup.blur_radius=20 \
                          popup.align=right

# Add 7 rows for the calendar view
for i in {0..6}; do
  sketchybar --add item calendar.row.$i popup.calendar \
             --set calendar.row.$i icon.drawing=off \
                                   label.font="SF Mono:Bold:13.0" \
                                   label.padding_left=14 \
                                   label.padding_right=14 \
                                   label.align=center \
                                   label.y_offset=0 \
                                   background.drawing=off \
                                   background.height=20
done
