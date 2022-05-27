#!/bin/sh

feh --bg-fill ~/Pictures/8093w42.jpeg & # set bg image
# picom &
xset r rate 280 40 &
xset r 66 &
setxkbmap -layout "us,th" -variant "colemak," -option "grp:alt_shift_toggle" &

dte() {
	dte="$(date +"%A, %Y %B %d - %H:%M:%S")"
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

volume() {
	volume="$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))"
	echo -e " $volume"
}

disk() {
	disk="$(df -h | awk '/\/dev\/sdc/ {print $4}')"
	echo -e "avail: $disk"
}

while true; do
	xsetroot -name "$(volume) | $(disk) | $(mem) | $(upd) | $(dte)"
	sleep 15s
done &

exec dwm
