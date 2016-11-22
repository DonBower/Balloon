#!/bin/bash
ts=$(date +"%Y/%m/%d %H:%M:%S")
echo $ts "Start WX, GPS, CAM" >>  /home/pi/balloon/testlog.txt
nohup /home/pi/balloon/runwx.py > /dev/null 2>&1 &
nohup /home/pi/balloon/rungps.sh > /dev/null 2>&1 &
nohup /home/pi/balloon/runcam.sh > /dev/null 2>&1 &
