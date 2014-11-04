#!/bin/bash
RxCur=0
TxCur=0
RxPrvAry=()
TxPrvAry=()
for (( i=0; i<64; i++ ))
do
	RxPrvAry[i]=0
	TxPrvAry[i]=0
done
mywlan_if=`sudo ls /var/run/wifi/`
idx=0
for wlan in ${mywlan_if[@]}
do
	mywlanlist[idx]=$wlan
	idx=$(($idx+1))
done
while [ 1 ]
do
	for (( i=0; i<${#mywlanlist[@]}; i++ ))
	do
		echo ${mywlanlist[i]}
		wlan=`echo ${mywlanlist[i]}`
		echo $wlan
		linkData=`ip -s link show $wlan`
		echo "linkData : "$linkData
		data=`echo $linkData|grep -Po '(?<=RX:\s)[^\n]*'`
		echo "data : "$data
		RxCur=`echo $linkData|grep -Po '(?<=RX:\s)[^\n]*'|awk '{print $7}'`
		echo "RxCur: "$RxCur
		TxCur=`echo $linkData|grep -Po '(?<=TX:\s)[^\n]*'|awk '{print $7}'`
		echo "TxCur: "$TxCur
		RxPrv=`echo ${RxPrvAry[i]}`
		echo $RxPrv
		RxDiff=`expr $RxCur - $RxPrv`
		echo "RxDiff: "$RxDiff
		RxAbs=$((RxDiff<0 ? 0-RxDiff : RxDiff ))
		echo "RxAbs: "$RxAbs
		TxPrv=`echo ${TxPrvAry[i]}`
		echo "TxPrv: "$TxPrv
		TxDiff=`expr $TxCur - $TxPrv`
		echo "TxDiff: "$TxDiff
		TxAbs=$((TxDiff<0 ? 0-TxDiff : TxDiff ))
		echo "TxAbs: "$TxAbs
		RxPrvAry[i]=$RxCur
		TxPrvAry[i]=$TxCur
		RxCur=0
		TxCur=0
	done
done