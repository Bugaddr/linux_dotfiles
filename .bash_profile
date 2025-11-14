#
# ~/.bash_profile
#
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
      exec startplasma-wayland
      ;;
    3)
      true
      ;;
    *)
      echo "Invalid choice, staying in TTY"
      ;;
  esac
fi

LIBVA_DRIVER_NAME=iHD
VDPAU_DRIVER=va_gl
VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json

[[ -f ~/.bashrc ]] && . ~/.bashrc
