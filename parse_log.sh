#!/usr/bin/env bash
FILE=~/workspace/test.log

# Checking Avaialbility of file
if [ ! -f $FILE ]
then
        echo "$FILE does not exists. Please specify correct file name"
        exit 2
fi
 
# Comparing the appropriate limit
limit=10
count=`sudo grep -o "valid" $FILE | wc -l`
echo "Count: $count"
echo "Limit: $limit"
if [ $count -ge $limit ]
then
    echo "You got error too many times"
else
    echo "its okay"
fi

