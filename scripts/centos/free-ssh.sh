#!/usr/bin/env bash

for ip in `cat iplist.txt`;
do
	ssh $ip "free -g";
done

