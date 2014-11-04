#!/bin/bash
for (( i=0; i<15; i++ ))
do
	ex=`sar -n DEV 1 1`
	echo $ex >> 1.txt
	ex1=`echo $ex|grep -Po '(?<=eth0\s)[^\n]*'|awk '{print $3,$4}'`
	echo $ex1
done	
