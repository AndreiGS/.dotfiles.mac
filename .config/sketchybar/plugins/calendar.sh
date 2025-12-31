#!/bin/bash

# Update the clock label
sketchybar --set $NAME label="$(date '+%a %d %b %H:%M')"

# Get the calendar output as an array of lines
IFS=$'\n' read -d '' -r -a CALlines <<< "$(cal | sed "s/$(date +%e) / [$(date +%e)] /")"

# Iterate and set labels for each row
for i in {0..6}; do
  # Get the line or empty string if not present
  line="${CALlines[$i]}"
  sketchybar --set calendar.row.$i label="$line"
done
