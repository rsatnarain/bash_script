#!/bin/bash

report="system_report_$(date +%F).txt"

echo "System Report" > "$report"
echo "------------------------------" >> "$report"

echo "IP Address: $(hostname)" >> "$report"

echo "Current User: $(whoami)" >> "$report"

echo "Disk Usage: " >> "$report"
df -h / >> "$report"
echo "-----------------------------" >> "$report"

echo "Data saved to $report"
echo "System report generation completed."
