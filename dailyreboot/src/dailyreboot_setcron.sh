#!/bin/sh

#reboottime=$1
#offset=$2

reboottime=$(uci get dailyreboot.dailyreboot.time)
offset=$(uci get dailyreboot.dailyreboot.offset)
enabled=$(uci get dailyreboot.dailyreboot.enabled)

#get hours of reboottime
hours=$(($(date -d "$reboottime" +"%H")))

#get minutes of reboottime
minutes=$(($(date -d "$reboottime" +"%M")))

#remove old cronjob from micrond folder
rm /usr/lib/micron.d/dailyreboot

if [ $enabled = "1" ]
then
	#write new cronjob into micron folder
	echo "$minutes $hours * * * /usr/bin/dailyreboot_check.sh $offset" > /usr/lib/micron.d/dailyreboot
	/etc/init.d/micrond restart
fi
