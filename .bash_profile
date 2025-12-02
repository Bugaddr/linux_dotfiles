#
# ~/.bash_profile
#
#!/usr/bin/env bash

# Start hyprland
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  echo "Select desktop environment:"
  echo "1) Hyprland"
  echo "2) Plasma"
  echo "3) Niri"
  echo "4) TTY"
  read -r choice

  case $choice in
    1)
      exec hyprland >/dev/null
      ;;
    2)
      exec startplasma-wayland
      ;;
    3)
      exec niri-session >/dev/null
      ;;
    4)
      true
      ;;
    *)
      echo "Invalid choice, staying in TTY"
      ;;
  esac
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
