#!/usr/bin/env zsh

# Start hyprland
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  echo "Select desktop environment:"
  echo "1) Hyprland"
  echo "2) Plasma"
  echo "3) TTY"
  read -r choice

  case $choice in
    1)
      exec hyprland >/dev/null
      ;;
    2)
      exec dbus-run-session startplasma-wayland
      ;;
    3)
      true
      ;;
    *)
      echo "Invalid choice, staying in TTY"
      ;;
  esac
fi
