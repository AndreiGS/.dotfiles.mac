#!/bin/bash

# Disk
FREE_DISK=$(df -h / | awk 'NR==2 {print $4}')

# CPU
CPU_USAGE=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')

# RAM - parse PhysMem line from top
RAM_LINE=$(top -l 1 | grep "PhysMem:")
# Extract used memory - handles formats like "6.6G" or "1800M"
used_val=$(echo "$RAM_LINE" | awk '{print $2}' | sed 's/[A-Za-z]//g')
used_unit=$(echo "$RAM_LINE" | awk '{print $2}' | sed 's/[0-9.]//g')

if [[ "$used_unit" == "G" ]]; then
    used_mb=$(echo "$used_val * 1000" | bc | awk '{printf "%.0f", $1}')
elif [[ "$used_unit" == "M" ]]; then
    used_mb=$(echo "$used_val" | awk '{printf "%.0f", $1}')
else
    used_mb=0
fi

total_ram_gb=$(($(sysctl -n hw.memsize) / 1024 / 1024 / 1024))

# Battery
BATT_INFO=$(pmset -g batt)
BATT_PERCENT=$(echo "$BATT_INFO" | grep -o "[0-9]\{1,3\}%" | sed 's/%//')
BATT_STATE=$(echo "$BATT_INFO" | grep -o "AC Power\|Battery Power")

BATT_STR=""
if [[ "$BATT_STATE" == "AC Power" ]]; then
    BATT_STR="CHR"
else
    BATT_STR="BAT"
fi

# Date & Time with year
DATE_TIME=$(date '+%d %b %Y %H:%M')

# Combine
sketchybar --set $NAME label="DISK: ${FREE_DISK} | CPU: ${CPU_USAGE}% | RAM: ${used_mb}MB/${total_ram_gb}GB | ${BATT_STR}: ${BATT_PERCENT}% | ${DATE_TIME}"
