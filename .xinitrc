#!/bin/sh

feh --bg-fill ~/Pictures/440596-anime-anime-girls-cherry-blossom-5-Centimeters-Per.png
picom &
xset r rate 280 40 &
xset r 66 &
setxkbmap -layout "us,th" -variant "colemak," -option "grp:alt_shift_toggle" &

dte() {
	dte="$(date +"%A, %Y %B %d - %H:%M:%S")"
	echo -e "$dte"	
}

upd() {
	upd="$(checkupdates | wc -l)"
	echo -e "$upd updates"
}

batt() {
	batt="$(acpi | awk '{print $4}')"
	echo -e "batt: $batt"
}

mem() {
	mem="$(free | awk '/Mem/ {printf "%dMiB/%d MiB\n", $3 / 1024, $2 / 1024}')"
	echo -e "mem: $mem"
}

volume() {
	volume="$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))"
	echo -e "vol: $volume"
}

disk() {
	disk="$(df -h | awk '/\/dev\/sda/ {print $4}')"
	echo -e "avail: $disk"
}

while true; do
	xsetroot -name "$(volume) | $(disk) | $(mem) | $(batt) | $(dte)"
	sleep 1s
done &

exec i3 
