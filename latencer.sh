#!/bin/bash
CURL=$(which curl)
AWK=$(which awk)
echo -n "Please pass the url you want to measure: "
read url
URL="$url"
result=`$CURL -o /dev/null -s -w %{time_connect}:%{time_starttransfer}:%{time_total} $URL`
echo "Host: $URL"
Time_Connect=`echo $result | $AWK -F: '{ print $1}'`
Time_startTransfer=`echo $result | $AWK -F: '{ print $2}'`
Time_total=`echo $result | $AWK -F: '{ print $3}'`
echo "Time_Connect: $Time_Connect"
echo "Time_startTransfer: $Time_startTransfer"
echo "Time_total: $Time_total"
