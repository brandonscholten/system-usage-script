#!/bin/bash
#This is a script for regularly checking system resource usage.
#Time intervals and number of processes listed are defined by the user.
#Once scanning is finished the output is saved in a log file and displayed in the terminal.
echo Welcome to System Resource Scanner!
read -p 'scans (type . for each scan: . . for two scans):' number
read -p 'time interval (seconds):' interval
read -p 'lines to record:' lines
echo ===log start=== > log.txt
for i in $number
do
export thingOne="1,"
export thingTwo="p"
export sedthing="$thingOne$lines$thingTwo"
ps -ax | sed -n $sedthing >> log.txt
echo ===end of log $i=== >> log.txt
date >> log.txt
echo =================== >> log.txt
echo system state logged!
echo waiting...
read -t $interval -p "waiting..."
done
echo finished logging :D
echo log:
sort baselog.txt
exit 0
