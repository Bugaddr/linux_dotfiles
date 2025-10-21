if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ]; then
    if [ "$XDG_VNTR" -eq 1 ]; then
        hyprland
    fi else if [ "$XDG_VNTR" -eq 2 ]; then
        true
    fi
fi
