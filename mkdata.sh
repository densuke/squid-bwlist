#!/bin/bash -x
if [ "x$1" = "x" ]; then
 echo "usage: $0 URL"
fi

echo -n > /tmp/href.txt
while [ ! "x$1" = "x" ]; do
 curl "$1" |grep 'a href.*http://' -i | egrep -o 'http://[^"]+'| cut -d/ -f3 | sort -u | sed $(awk '{printf("-e /^.*" $1 "$/d ");}' ~/work/squid-bwlist/blackhost.txt  )    |tee -a /tmp/href.txt.$$
 shift
done
sort -u /tmp/href.txt.$$ > /tmp/href.txt

