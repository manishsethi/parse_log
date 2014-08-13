#!/usr/bin/env bash
#FILE= /home/minjar05/workspace/test.txt

# Checking Avaialbility of file
#if [ ! -f $FILE ]
#then
#        echo "$FILE does not exists. Please specify correct file name"
#        exit 2
#fi
 
# Comparing the appropriate limit

limit=10
#count=`sudo grep -o "valid" $FILE | wc -l`

sh /usr/lib/nagios/plugins/check_log -F /home/minjar05/workspace/parse_log/qfchat-data-acquisition.log -O /home/minjar05/workspace/parse_log/tmp.log -q "work"|awk -F'(' '{ print $2}' | awk -F')' '{print $1}' > output.txt


count=$(sudo cat output.txt)


echo "Count: $count"
echo "Limit: $limit"
if [ $count >  $limit ]
then
    echo "You had reached the limit. Email is send to Admin" | ssmtp -s "Test" manishsethi2009@gmail.com  # Sending email
else
    echo "its okay"
fi

