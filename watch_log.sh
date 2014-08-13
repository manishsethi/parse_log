#!/bin/bash
GAP=10    #How long to wait
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
	echo "Total: $newlen"
	echo "$newlines" > test.txt
        count=$(sudo cat test.txt)
	echo "Updated: $newlines"
	tail -$newlines $LOGFILE 
#       tail -$newlines $LOGFILE > temp.txt
        len=$newlen
     fi
	
echo "Count: $count"
sudo tail -n $count /home/minjar05/workspace/parse_log/qfchat-data-acquisition.log > temp.txt
count=`sudo grep -o "work" temp.txt | wc -l`
limit=3
if [ $count -ge $limit ]
then
    echo "You got error too many times"
else
    echo "its okay"
fi
sleep $GAP
done
exit 0
