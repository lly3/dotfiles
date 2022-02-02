#!/bin/sh

feh --bg-fill ~/Pictures/83106977_p0.jpg &
picom &
xset r rate 280 40 &
setxkbmap -layout "us,th" -variant "colemak," -option "grp:alt_shift_toggle" &

dte() {
	dte="$(date +"%A, %Y %B %d - %H-%M")"
	echo -e " $dte"	
}

upd() {
	upd="$(checkupdates | wc -l)"
	echo -e " $upd updates"
}

mem() {
	mem="$(free | awk '/Mem/ {printf "%dMiB/%d MiB\n", $3 / 1024, $2 / 1024}')"
	echo -e " $mem"
}

while true; do
	xsetroot -name "$(mem) | $(upd) | $(dte)"
	sleep 10s
done &

exec dwm
