#!/bin/bash

if [[ $1 == dark ]]; then
	dconf write /org/gnome/shell/extensions/user-theme/name "'catppuccin-mocha-blue-standard+default'"
	dconf write /org/gnome/desktop/interface/gtk-theme "'catppuccin-mocha-blue-standard+default'"
	echo "Dark"
else
	dconf write /org/gnome/shell/extensions/user-theme/name "'catppuccin-latte-blue-standard+default'"
	dconf write /org/gnome/desktop/interface/gtk-theme "'catppuccin-latte-blue-standard+default'"
	echo "Light"
fi

# Setup: 
# Download this script and paste it in ~/.themes
# Make it executable by chmod +x
# Use the theme name that you want
# https://ibb.co/dJJw1vy
