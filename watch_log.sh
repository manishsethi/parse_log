#!/bin/bash
GAP=10    #How long to wait
LOGFILE=$1 #File to log to

if [ "$#" -ne "1" ]; then
    echo "USAGE: `basename $0` <file with absolute path>"
    exit 1
fi

count=0
counter1=0
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
limit=2
temp=10
# Checking the limit

awk '/work/ {for(i=1; i<=2; i++) {getline; print}}' temp.txt > output.txt

counter1=`sudo grep -o "work" output.txt | wc -l`
echo "counter: $counter1"
echo "limit: $limit"
if [ $counter1 -ge $limit ]
then
    echo "Limit Exceeded"
    echo "You had reached the limit. Email is send to Admin" | ssmtp -s "Test" manishsethi2009@gmail.com  # Sending email
else
    echo "its okay"
fi
sleep $GAP
done
exit 0
