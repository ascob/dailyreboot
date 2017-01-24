#!/bin/sh

#reboottime=$1
#offset=$2

reboottime=$(uci get rebootcron.rebootcron.time)
offset=$(uci get rebootcron.rebootcron.offset)
enabled=$(uci get rebootcron.rebootcron.enabled)


#get hours of reboottime
hours=$(($(date -d "$reboottime" +"%H")))

#get minutes of reboottime
minutes=$(($(date -d "$reboottime" +"%M")))

crontab -l | grep -v 'rebootscript'  | crontab -

if [ $enabled = "1" ]
then
    #set cronjob
	#write out current crontab
	crontab -l > mycron
	#echo new cron into cron file
	echo "$minutes $hours * * * /usr/bin/rebootscript $offset" >> mycron
	#install new cron file
	crontab mycron
rm mycron
fi
