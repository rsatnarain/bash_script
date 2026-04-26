#!/bin/bash

report "system_report_$(date +%F).txt

echo "System Report" > "$report"
echo "------------------------------"
echo "IP Address: "$(hostname -I)" >> "$report"
echo "Current User: "$(whoami)" >> "$report"
echo "Disk Usage: " >> "$report"
df -h / >> "$report"
echo "Data saved to $report"
echo "-----------------------------"
