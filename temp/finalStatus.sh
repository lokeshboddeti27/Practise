#!/bin/bash
while [ 1 ]
do
	state=`sar -n DEV 1 1`
	echo $state >> 1.txt
	for (( i=0; i<64; i++ ))
	do
		mywlan_if=`echo "mywlan$i"`
		wpastate=`sudo wpa_cli -p /var/run/wifi -i$mywlan_if status |grep ^wpa_state= |cut -f2- -d=`
		if [ "$wpastate" == "COMPLETED" ]
		then
			RxTx=`echo $state|grep -Po '(?<=$mywlan_if\s)[^\n]*'|awk '{print $3,$4}'`
			echo $RxTx
		fi
	done
	sleep 1
done