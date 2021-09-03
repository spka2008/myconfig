#!/bin/bash
# These things are run when an Openbox X Session is started.
# You may place a similar script in $HOME/.config/openbox/autostart
# to run user-specific things.
#

# If you want to use GNOME config tools...
#
#if test -x /usr/lib/openbox/gnome-settings-daemon >/dev/null; then
#  /usr/lib/openbox/gnome-settings-daemon &
#elif which gnome-settings-daemon >/dev/null 2>&1; then
#  gnome-settings-daemon &
#fi

# If you want to use XFCE config tools...
#
#xfce-mcs-manager &

xkbcomp .config/xkb/my :0
xrandr --output LVDS1 --rotate normal
xrandr --output VGA1 --mode 1920x1080 
xrandr --output VGA1 --right-of LVDS1
sleep 60
xrandr --output HDMI1 --mode 1920x1080
xrandr --output HDMI1 --same-as VGA1
#xrandr --output LVDS1 --left-of VGA1
#setxkbmap -layout us,ru -variant -option grp:ctrl_shift_toggle,grp_led:scroll
#xrandrsetup=true
#export #xrandrsetup
