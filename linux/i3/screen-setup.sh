#!/bin/bash

move_workspace() {
  WS=$1
  OUT=$2
  if xrandr | grep -A1 "^$OUT connected" | grep -q " connected"; then
    i3-msg "workspace $WS; move workspace to output $OUT"
  else
    echo "[WARN] Output $OUT not available: skipping $WS"
  fi
}

# Xác định 2 màn hình chính: DP-1 (trái), HDMI-1 (phải)
LEFT_OUTPUT="DP-1"
RIGHT_OUTPUT="HDMI-1"

# Gán 1L–4L cho màn hình trái, 1R–4R cho phải
for i in $(seq 1 4); do
  move_workspace "${i}L" "$LEFT_OUTPUT"
  move_workspace "${i}R" "$RIGHT_OUTPUT"
done