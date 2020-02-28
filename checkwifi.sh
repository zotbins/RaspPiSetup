#!/bin/bash
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
do
echo "hello"
ping -c5 google.com > /dev/null

if [ $? -eq 0 ]
then
	exit
fi
echo "No network connection, restarting wlan0"
/sbin/ifdown 'wlan0'
sleep 5
/sbin/ifup --force 'wlan0'
done
