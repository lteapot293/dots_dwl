#!/bin/sh
wbg /home/teapot293/wallp/1.png &
dunst &
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
gsettings set org.gnome.desktop.interface gtk-theme Nordic &
gsettings set org.gnome.desktop.interface cursor-size 15 &
gsettings set org.gnome.desktop.interface font-name Fira code medium 12 &
gsettings set org.gnome.desktop.interface cursor-theme Catppuccin-Mocha-Dark-Cursors &
someblocks -p | while read -r line; do dwlb -status all "$line"; done &
 
