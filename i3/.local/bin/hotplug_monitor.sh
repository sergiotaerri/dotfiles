#!/bin/bash

X_USER=serjo
export DISPLAY=:0
export XAUTHORITY=/home/$X_USER/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

function connect()
{
    xfce4-panel-profiles load /home/$X_USER/.i3/multi-monitor.tar.bz2 
}

function disconnect()
{
    xfce4-panel-profiles load /home/$X_USER/.i3/single-monitor.tar.bz2 
}

DISPLAY_PATH='/sys/class/drm/card0-DP-5/status'
if [ -f $DISPLAY_PATH ] ; then
	if [ $(cat $DISPLAY_PATH) == "connected" ] ; then
	  connect
	elif [ $(cat $DISPLAY_PATH) == "disconnected" ] ; then
	  disconnect
	else
	  exit
	fi
else
	disconnect
fi
