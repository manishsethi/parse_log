#!/bin/bash
GAP=10     #How long to wait
LOGFILE=$1 #File to log to

if [ "$#" -ne "1" ]; then
    echo "USAGE: `basename $0` <file with absolute path>"
    exit 1
fi


#Get current long of the file
len=`wc -l $LOGFILE | awk '{ print $1 }'`
echo "Current size is $len lines."

while :
do
    if [ -N $LOGFILE ]; then
        echo "`date`: New Entries in $LOGFILE: "
        newlen=`wc -l $LOGFILE | awk ' { print $1 }'`
        newlines=`expr $newlen - $len`
        tail -$newlines $LOGFILE
        len=$newlen
    fi
sleep $GAP
done
exit 0
