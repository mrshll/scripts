#!/bin/bash

#for each id of wacom devices set correct output monitor
xsetwacom list devices |
while IFS= read -r line; do
  #get id of wacom device in line
  WACOM_ID="$(echo $line | sed 's/.*id: //' | cut -d " " -f 1)"
  #set monitor as output
  xsetwacom --set $WACOM_ID MapToOutput HEAD-0
done
