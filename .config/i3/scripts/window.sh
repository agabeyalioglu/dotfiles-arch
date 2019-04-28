#!/bin/sh

i3-msg workspace 3;
urxvt & 
sleep 0.05 
urxvt -e vtop & 
sleep 0.2
i3-msg split vertical
urxvt --hold -cd ~/Documents/Code &
sleep 0.3
i3-msg focus left 
i3-msg resize grow width 180px 

