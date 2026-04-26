#!/bin/bash
hostname_value=$(hostname)
ip_address=$(hostname -I | awk '{print $1}')
echo "Hello from a script"
echo "Hostname: $hostname_value"
echo "IP Address: $ip_address"
