#!/bin/bash

scrot -s -e 'mv $f ~/Screenshots'
notify-send "Screenshot" "Screenshot has been taken!" -i ~/.config/i3/scripts/photo-camera.png -t 2000
