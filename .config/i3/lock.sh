#!/bin/bash

# Take a screenshot:
#scrot /tmp/screen.png

# Create a blur on the shot:
convert Screenshots/lock.* -resize 1400x1000 -channel RGBA -blur 0x8 Screenshots/lockFinal.jpg

# Add the lock to the blurred image:
#[[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png  ~/.config/i3/lock.png -gravity center -composite -matte /tmp/screen.png

# Pause music (mocp and mpd):
#mocp -P
#mpc pause

# Lock it up!
i3lock -e --force-clock -k --veriftext="" --wrongtext=""  --timecolor=01196099 --datecolor=01196099 --ring-width=3 --insidecolor=00000000 --insidevercolor=00000000 --insidewrongcolor=ad010100 --wrongcolor=00000000 --ringcolor=a3098e00 --ringvercolor=a3098e00 --ringwrongcolor=b7070799 --keyhlcolor=93080800 --separatorcolor=00000000 --layoutcolor=00000000 --linecolor=5a046680 --indicator -i Screenshots/lockFinal.*

# If still locked after 20 seconds, turn off screen.
#sleep 20 && pgrep i3lock && xset dpms force off
