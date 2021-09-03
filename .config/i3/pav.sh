#!/bin/bash

if pactl list sinks | grep hdmi > /dev/null
then 
	pactl set-card-profile alsa_card.pci-0000_00_1b.0 output:analog-stereo+input:analog-stereo
	echo "зал" > /home/serg/.config/i3status/pav
else 
	pactl set-card-profile alsa_card.pci-0000_00_1b.0 output:hdmi-stereo
	echo "кух" >  /home/serg/.config/i3status/pav
fi
