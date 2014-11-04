#!/bin/bash
mywlanlist=()
mywlan0RxPrv=0
for (( i=0; i<10; i++ ))
do
	mywlanlist[i]=0
done
for (( i=0; i<10; i++ ))
do
	echo ${mywlanlist[$i]}
done
wlan="mywlan0"
for (( i=0; i<${#mywlanlist[@]}; i++ ))
do
	RxPrv=`echo "$wlan"RxPrv`
	echo $RxPrv
done
echo ${mywlanlist[2]}