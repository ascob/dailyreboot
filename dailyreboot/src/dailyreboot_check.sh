#!/bin/sh

randomresult=1
_math_random_integer()		# OUT1: integer, higher or equal => $START and lower or equal <= $END
{
	local start="${1:-0}"
	local end="${2:-60}"

	local seed diff random out

	seed="$( hexdump -n 2 -e '/2 "%u"' /dev/urandom )"	# e.g. 0...65536
	[ $end -gt 65536 ] && seed=$(( seed * seed ))

	diff=$(( end + 1 - start ))
#	divisor_valid "$diff" || diff=1	# happens with input start=1 end=0
	random=$(( seed % diff ))	# result: integer somewhere between 0...$diff - divisor_valid
	randomresult=$(( start + random ))
	echo "${randomresult:-$start}"
}


offset=$1
_math_random_integer 0 $offset
randomoffset=$(($randomresult*60))
echo $randomoffset

if [ $(cat /proc/uptime | cut -d'.' -f1) -gt 3600 ]
then
    echo "Cool Beans"
    sleep $randomoffset
    logger dailyreboot "Rebooting now."
    reboot &
    sleep 30s
    echo b > /proc/sysrq-trigger
else
    echo "Less then 1 hour uptime."
    logger dailyreboot "Less then 1 hour uptime."
fi
