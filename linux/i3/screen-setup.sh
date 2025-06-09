#!/bin/bash

# Lấy danh sách các output đã kết nối
CONNECTED_OUTPUTS=$(xrandr | grep " connected" | cut -d" " -f1)

# Hàm log cho debug (tuỳ chọn)
log() {
  echo "[INFO] $1"
}

if echo "$CONNECTED_OUTPUTS" | grep -q "^DP-1$" && echo "$CONNECTED_OUTPUTS" | grep -q "^HDMI-1$"; then
  # Cấu hình ở công ty: DP-1 + HDMI-1
  log "Detected office setup: DP-1 + HDMI-1"
  xrandr --output eDP-1 --off \
         --output DP-1 --primary --auto \
         --output HDMI-1 --auto --right-of DP-1

elif echo "$CONNECTED_OUTPUTS" | grep -q "^DP-1$"; then
  # Cấu hình ở nhà: eDP-1 + DP-1
  log "Detected home setup: eDP-1 + DP-1"
  xrandr --output eDP-1 --primary --auto \
         --output DP-1 --auto --right-of eDP-1

else
  # Chỉ dùng màn hình laptop
  log "Detected laptop-only setup"
  xrandr --output eDP-1 --auto --primary \
         --output DP-1 --off \
         --output HDMI-1 --off
fi