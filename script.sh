# Author: Rob
# Creation Date: 2026-04-26
# Description: Bash Scripting Example with Mac 

#!/bin/bash
hostname_value=$(hostname)
ip_address=$(hostname -I | awk '{print $1}')
echo "Hello from a script"
echo "Hostname: $hostname_value"
echo "IP Address: $ip_address"

ping -c 1 google.com
if [ $? -eq 0 ]; then
    echo "Internet connectivity is working."
else
    echo "Internet connectivity is not working."
fi