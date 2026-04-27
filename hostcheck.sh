#!/bin/bash

for host in 8.8.8.8 1.1.1.1 google.com 
do
	echo "Testing $host ..."
	ping -c 1 "$host"
	echo ""
done
