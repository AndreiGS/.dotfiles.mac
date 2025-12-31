#!/bin/sh

if [ "$SENDER" = "front_app_switched" ] || [ "$SENDER" = "forced" ] || [ "$SENDER" = "" ]; then
  # If INFO is empty, get it manually
  if [ "$INFO" = "" ]; then
    INFO=$(aerospace list-windows --focused --format %{app-name})
  fi
  sketchybar --set $NAME label="$INFO" icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$INFO")"
fi
