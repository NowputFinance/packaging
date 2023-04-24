
Debian
====================
This directory contains files used to package nowp/nowp-qt
for Debian-based Linux systems. If you compile nowp/nowp-qt yourself, there are some useful files here.

## nowp: URI support ##


nowp-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install nowp-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your peercoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/nowp128.png` to `/usr/share/pixmaps`

nowp-qt.protocol (KDE)

