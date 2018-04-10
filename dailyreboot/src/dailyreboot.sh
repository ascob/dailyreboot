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

#remove line containing 'dailyreboot' from crontab
crontab -l | grep -v 'dailyreboot'  | crontab -

if [ $enabled = "1" ]
then
	#set cronjob
	#write out current crontab
	crontab -l > mycron
	#echo new cron into cron file
	echo "$minutes $hours * * * /usr/bin/dailyreboot $offset" >> mycron
	#install new cron file
	crontab mycron
	rm mycron
fi
