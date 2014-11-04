#!/bin/bash
RxPrv=0
TxPrv=0
RxCur=0
TxCur=0
while [ 1 ]
do
	linkData=`ip -s link show eth0`
	echo "linkData : "$linkData
#	RX=`echo $linkData|grep -Po '(?<=RX:\s)[^\n]*'|awk '{print $7}'`
#	echo "RX : "$RX
#	TX=`echo $linkData|grep -Po '(?<=TX:\s)[^\n]*'|awk '{print $7}'`
#	echo "TX : "$TX
	RxCur=`echo $linkData|grep -Po '(?<=RX:\s)[^\n]*'|awk '{print $7}'`
#	RxCur=`ip -s link show eth0|grep -A1 RX:|cut -d$'\n' -f2|awk '{print $1}'`
	echo "RxCur: "$RxCur
	TxCur=`echo $linkData|grep -Po '(?<=TX:\s)[^\n]*'|awk '{print $7}'`
	echo "TxCur: "$TxCur
	RxDiff=`expr $RxCur - $RxPrv`
	echo "RxDiff: "$RxDiff
	RxAbs=$((RxDiff<0 ? 0-RxDiff : RxDiff ))
	echo "RxAbs: "$RxAbs
	RxPrv=`echo $RxCur`
	echo "RxPrv: "$RxPrv
#	sleep 1
done