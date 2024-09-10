#!/bin/bash

# Check if SwayNC is already running
if pgrep swaync > /dev/null; then
    # Toggle SwayNC visibility (you can replace this with your method of showing/hiding SwayNC)
    swaync-client -t

    # Simulate sliding in by adjusting margins
    hyprctl keyword margin "eDP-1,0 0 0 0"  # Reset margins
else
    # Toggle SwayNC visibility off
    swaync-client -t

    # Simulate sliding out by setting margins
    hyprctl keyword margin "eDP-1,100 0 0 0"  # Adjust margin to move it off-screen
fi
