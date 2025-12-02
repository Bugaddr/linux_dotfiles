#!/bin/sh
if [ -n "$WAYLAND_DISPLAY" ]; then
    # Prevent xrdb from being called under Wayland
    export XRDB=noop
fi

