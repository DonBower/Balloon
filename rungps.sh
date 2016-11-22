#!/bin/bash
BASEDIR="/mnt/usbstick"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE=$BASEDIR/gpslog.txt
DATAFILE=$BASEDIR/gpsdata-$DATE.txt
ts=$(date +"%Y/%m/%d %H:%M:%S.%N")
echo $ts "Start GPS Process" >> $LOGFILE
while [ 1 ]
do
    read this_line

    # if cr/lf bothers you, make it lf only
    # (os-specfic concern)
    #
    this_line=$( echo $this_line | sed s/$'\r'//g )

    # get a precise time stamp
    # %N = nanoseconds
    #
    ts=$(date +"%Y/%m/%d %H:%M:%S.%N")

    echo $ts $this_line >> $DATAFILE

    # let us filter the current position
    #
	if [[ "$this_line" =~ "GPGGA" ]]
	then
		gps_time=$(echo $this_line | cut -d, -f 2)
		gps_latdeg=$(echo $this_line | cut -d, -f 3)
		gps_latdir=$(echo $this_line | cut -d, -f 4)
		gps_londeg=$(echo $this_line | cut -d, -f 5)
		gps_londir=$(echo $this_line | cut -d, -f 6)
		gps_fix=$(echo $this_line | cut -d, -f 7)
		gps_sats=$(echo $this_line | cut -d, -f 8)
		gps_hdop=$(echo $this_line | cut -d, -f 9)
		gps_elev=$(echo $this_line | cut -d, -f 10)
		echo $this_line >> $DATAFILE
	fi


done < /dev/ttyAMA0
