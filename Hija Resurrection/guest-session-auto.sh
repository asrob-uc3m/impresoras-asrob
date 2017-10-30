#!/bin/sh
#
# Copyright (C) 2013 Canonical Ltd
# Author: Gunnar Hjalmarsson <gunnarhj@ubuntu.com>
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, version 3 of the License.
#
# See http://www.gnu.org/copyleft/gpl.html the full text of the license.

# This script is run via autostart at the launch of a guest session.

export TEXTDOMAINDIR=/usr/share/locale-langpack
export TEXTDOMAIN=lightdm

# disable screen locking
gsettings set org.gnome.desktop.lockdown disable-lock-screen true


# run possible local startup commands
test -f /etc/guest-session/auto.sh && . /etc/guest-session/auto.sh


# cp -r /usr/share/asrob/RepetierHost ~/.local/share/
mkdir -p ~/.mono/registry/CurrentUser/software
cp -r /usr/share/asrob/repetier ~/.mono/registry/CurrentUser/software
cp -r /usr/share/asrob/.Slic3r ~/
cp -r /usr/share/asrob/Repetier-Host.desktop ~/Desktop
cp -r /usr/share/asrob/Calibration ~/Desktop

#Disable auto-logout (Prueba)
export TMOUT=0
xset s 0 dpms 0 0 0

# info dialog about the temporary nature of a guest session
dialog_content () {
	TITLE=$(gettext 'Temporary Guest Session')
	TEXT=$(gettext '
IMPORTANT NOTICE:
All data created during this guest session will be deleted when
you log out, and settings will be reset to defaults.
Please save files on some external device, for instance a USB
stick, if you would like to access them again later.


AVISO IMPORTANTE:
Toda la información creada en esta sesión será eliminada al
cerrar sesión, y la configuración se restablecerá por defecto.
Por favor, utiliza un medio extraíble, como una memoria USB,
para salvar los archivos si no quieres perderlos.')
}

dialog_content
zenity --info --title="$TITLE" --width=500 --height=200 --text="$TEXT" --no-wrap
