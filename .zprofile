#!/usr/bin/env zsh

# Start hyprland
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  export WLR_DRM_DEVICES=/dev/dri/card0
  exec Hyprland
fi
