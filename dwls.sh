#!/bin/sh

fname="$HOME"/.cache/dwltags

swaybg -i /home/teapot293/wallp/1.png &
dunst &
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
gsettings set org.gnome.desktop.interface gtk-theme Nordic &
gsettings set org.gnome.desktop.interface cursor-size 15 &
gsettings set org.gnome.desktop.interface font-name Fira code medium 12 &
gsettings set org.gnome.desktop.interface cursor-theme Catppuccin-Mocha-Dark-Cursors &
gsettings set org.gnome.desktop.wm.preferences button-layout "" &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
waybar &

while 
	read line; do echo $line >> ${fname} ; 
	IFS=' ' read -ra lsResultLine <<< $(ls -sk ${fname})
	if [ $((lsResultLine[0])) -gt 100 ]; then 
		echo "$(tail -n 50 ${fname})" > ${fname}
	fi
done
