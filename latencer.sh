#!/bin/bash
 CURL="/usr/bin/curl"
 GAWK="/usr/bin/gawk"
 echo -n "Please pass the url you want to measure: "
 read url
 URL="$url"
 result=`$CURL -o /dev/null -s -w %{time_connect}:%{time_starttransfer}:%{time_total} $URL`
 echo "Host: $URL"
 Time_Connect=`echo $result | $GAWK -F: '{ print $1}'`
 Time_startTransfer=`echo $result | $GAWK -F: '{ print $2}'`
 Time_total=`echo $result | $GAWK -F: '{ print $3}'`
 echo "Time_Connect: $Time_Connect"
 echo "Time_startTransfer: $Time_startTransfer"
 echo "Time_total: $Time_total"
