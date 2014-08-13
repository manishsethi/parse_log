#!/usr/bin/env bash
#FILE= /home/minjar05/workspace/test.txt

# Checking Avaialbility of file
#if [ ! -f $FILE ]
#then
#        echo "$FILE does not exists. Please specify correct file name"
#        exit 2
#fi
 
# Comparing the appropriate limit

#limit=10
#count=`sudo grep -o "valid" $FILE | wc -l`

diff -u /home/minjar05/workspace/parse_log/qfchat-data-acquisition.log /home/minjar05/workspace/parse_log/tmp.log > /home/minjar05/workspace/parse_log/comp.log

while read line
do
 echo $line
 echo `grep -o "work" `
# if 
# then 
# fi
done  < comp.log



sh /usr/lib/nagios/plugins/check_log -F /home/minjar05/workspace/parse_log/qfchat-data-acquisition.log -O /home/minjar05/workspace/parse_log/tmp.log -q "work"|awk -F'(' '{ print $2}' | awk -F')' '{print $1}' > output.txt


count=$(sudo cat output.txt)
echo $count

#echo "Count: $count"
#echo "Limit: $limit"
#if [ $count >  $limit ]
#then
#    echo "You had reached the limit. Email is send to Admin" | ssmtp -s "Test" admin@gmail.com  # Sending email
#else
#    echo "its okay"
#fi

