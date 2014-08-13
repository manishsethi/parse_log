#!/bin/bash
FILE=~/workspace/test.log

# Checking Avaialbility
if [ ! -f $FILE ]
then
        echo "$FILE does not exists. Please specify correct file name"
        exit 2
fi
 
# Comparing the appropriate limit

limit=10
count= sudo grep -o "testnotvalid" $FILE | wc -l
echo $count
echo $limit
if $count > $limit
then
  echo "You got error too many times"
else 
  echo "its okay"
fi
