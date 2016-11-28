#!/bin/bash
#####################################################################################################
# rtvprediction.sh - This script will retreive the predictided landing zone for a balloon           #
# based on 21 burst elevations, ranging from 5000 meters to 15000 meters in 500 meter increments.   #
# 2016/11/28 -  Initial Release                                                                     #
#               Don Bower                                                                           #
#####################################################################################################

LAUNCHYear=2016
LAUNCHMonth=11
LAUNCHDay=28
LAUNCHHour=06   # Must be 00, 06, 12 or 18
LAUNCHTIME=$LAUNCHYear$LAUNCHMonth$LAUNCHDay$LAUNCHHour
LAUNCHLat=34.65
LAUNCHLon=-117.6
BURST=5000

rm predict.txt

for BURST in 5000 5500 6000 6500 7000 7500 8000 8500 9000 9500 10000 10500 11000 11500 12000 12500 13000 13500 14000 14500 15000
do
    curl -G -v "http://weather.uwyo.edu/cgi-bin/balloon_traj" \
    --data "TIME=$LAUNCHTIME" \
    --data "FCST=0" \
    --data "POINT=none" \
    --data "LAT=$LAUNCHLat" \
    --data "LON=$LAUNCHLon" \
    --data "TOP=$BURST" \
    --data "CALCDROP=on" \
    --data "MASS=1.2" \
    --data "DIAM=2" \
    --data "Cd=0.7" \
    --data "OUTPUT=list" > landing.txt

    while  read this_line; do
        read this_line
            last_time=$(echo $this_line | cut -d ' ' -f 1)
            last_lat=$(echo $this_line | cut -d ' ' -f 2)
            last_lon=$(echo $this_line | cut -d ' ' -f 3)
            time_delim1=$(echo $last_time | cut -b 3 )
            time_delim2=$(echo $last_time | cut -b 6 )
            time_delim=$time_delim1$time_delim2
            if [[ "$time_delim" == "::" ]] 
            then
                land_time=$last_time
                land_lat=$last_lat
                land_lon=$last_lon
            fi
    done < landing.txt
    echo Burst: $BURST Flight Time: $land_time Lat: $land_lat Lon: $land_lon >> predict.txt
done