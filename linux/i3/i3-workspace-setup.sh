#!/bin/bash

CONNECTED_OUTPUTS=$(xrandr | grep " connected" | cut -d" " -f1)

# Hàm gửi workspace tới output
move_workspace() {
  WORKSPACE=$1
  OUTPUT=$2
  i3-msg "workspace $WORKSPACE; move workspace to output $OUTPUT"
}

if echo "$CONNECTED_OUTPUTS" | grep -q "^DP-1$" && echo "$CONNECTED_OUTPUTS" | grep -q "^HDMI-1$"; then
  # Văn phòng: DP-1 + HDMI-1
  echo "Setting up workspace for office"
  move_workspace 1 DP-1
  move_workspace 4 DP-1
  move_workspace 2 HDMI-1
  move_workspace 3 HDMI-1

elif echo "$CONNECTED_OUTPUTS" | grep -q "^DP-1$"; then
  # Ở nhà: eDP-1 + DP-1
  echo "Setting up workspace for home"
  move_workspace 1 eDP-1
  move_workspace 2 DP-1
  move_workspace 3 DP-1
  move_workspace 4 eDP-1

else
  # Chỉ dùng màn hình laptop
  echo "Setting up workspace for laptop only"
  move_workspace 1 eDP-1
  move_workspace 2 eDP-1
  move_workspace 3 eDP-1
  move_workspace 4 eDP-1
fi
