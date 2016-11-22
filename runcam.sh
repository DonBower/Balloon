#!/bin/bash
BASEDIR="/mnt/usbstick"
while true; do 
	DATE=$(date +"%Y-%m-%d_%H-%M-%S")
	raspistill -n -vf -hf -o $BASEDIR/$DATE.jpg
	sleep 2s
done
