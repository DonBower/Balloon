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

    echo $ts $this_line >> full-log.txt

    # let us filter the current position
    #
    if [[ "$this_line" =~ "GPRMC" ]]
    then
        # ok, it looks like a GPS reading (may be void)
        # if field 3 is V, the reading is void (or maybe
        # only untrusted?), if it is A, then the position
        # is Active (and therefore given with confidence?)
        #
        if [[ $(echo $this_line | cut -d, -f 4-6) != ",,," ]]
        then
            # get latitude and longitude
            gps_pos=($(echo $this_line | \
                cut -d, -f 3-7 | \
                tr , ' ' | \
                sed 's/\(^0*\)\|\(\b0*\)//g'))
            # show
            echo $ts ${gps_pos[@]}
#	    sleep 2s
        fi
    fi
done < /dev/ttyAMA0
