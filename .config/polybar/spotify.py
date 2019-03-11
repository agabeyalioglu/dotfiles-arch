#!/bin/python

import sys
import dbus

trunclen = 45

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")

    spotify_properties = dbus.Interface(spotify_bus, "org.freedesktop.DBus.Properties")

    metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")

    artist = metadata['xesam:artist'][0]
    song = metadata['xesam:title']


    output = artist + ': ' + song

    if len(output) > trunclen:
        output = output[0:trunclen-3]
        output += '...'
        if ('(' in output) and (')' not in output):
            output += ')'

    else:
        output += " "*(trunclen - len(output))

    # Python3 uses UTF-8 by default.
    if sys.version_info.major == 3:
        print(output)
    else:
        print(output.encode('UTF-8'))
except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        print("")
    else:
        print(e)
