#!/bin/bash

ip=$1
link="http://www.geobytes.com/IpLocator.htm?GetLocation&IpAddress=$1"
curl -s $link > /tmp/out
cat /tmp/out | awk '/Latitude</{getline;print;}' | cut -d'"' -f6
cat /tmp/out| awk '/Longitude</{getline;print;}' | cut -d'"' -f6
rm /tmp/out
