#!/usr/bin/env zsh

# Start hyprland
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  echo "Select desktop environment:"
  echo "1) Hyprland"
  echo "2) Plasma"
  echo "3) TTY (no GUI)"
  read -r choice

  case $choice in
    1)
      exec Hyprland >/dev/null
      ;;
    2)
      exec startplasma-wayland
      ;;
    3)
      # Stay in TTY
      ;;
    *)
      echo "Invalid choice, staying in TTY"
      ;;
  esac
fi
