#!/usr/bin/env bash


i=0
while read -r line
do
	let i++
	echo $i $line
	./run-snappy-sql.sh $i $line
done < date.txt