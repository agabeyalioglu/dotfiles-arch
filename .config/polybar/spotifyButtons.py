#!/bin/python

import sys
import dbus
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-m", "--mode", help="Mode of the button", type=int)
args = parser.parse_args()

if args.mode is not None:
    mode = args.mode
else:
    mode = 0

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")

    spotify_properties = dbus.Interface(spotify_bus, "org.freedesktop.DBus.Properties")
    status = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "PlaybackStatus")

    if mode == 0:
        output = "  "
    elif mode == 1:
        output = "  "
    else:
        if(status == "Playing"):
            output = "  "
        else:
            output = "  "
    print(output)
except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        print("")
    else: 
        print(e)


