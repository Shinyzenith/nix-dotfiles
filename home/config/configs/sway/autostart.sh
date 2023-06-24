#!/usr/bin/env bash
killall wlsunset
coords="${XDG_CACHE_HOME:-$HOME/.cache}/coords"
if [[ ! -f $coords ]];then
	curl "https://json.geoiplookup.io/$(curl https://ipinfo.io/ip)" > $coords
fi
wlsunset -l $(echo $coords | jq -r .latitude) -L $(echo $coords | jq -r .longitude) &
bash ~/.config/bin/gtktheme
#killall polkit-gnome-authentication-agent-1
#/usr/libexec/polkit-gnome-authentication-agent-1 &
killall nm-applet
nm-applet --indicator &
killall mako
mako
