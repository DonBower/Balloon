#!/bin/bash
echo "Just a test" >  testlog.txt
nohup ./runwx.py > /dev/null 2>&1 &
nohup ./rungps.sh > /dev/null 2>&1 &
nohup ./runcam.sh > /dev/null 2>&1 &
