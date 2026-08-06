#!/bin/bash
set -euo pipefail

HOST_NAME=$(hostname)
SYS_KERNEL=$(uname -sr)
CLEAN_UPTIME=$(uptime -p | sed 's/^up //')

echo "=== INFOS SYS. $HOST_NAME ($SYS_KERNEL) | Uptime: $CLEAN_UPTIME ==="

echo "[RAM]"
free -h | awk '/Mem:/ {printf "Total: %s | Utilisé: %s | Disponible: %s \n", $2, $3, $7}'

echo "[STOCKAGE]"
df -h --total | grep -E '^/dev/|^total' | grep -v 'loop'

echo "[CPU]"
if [ -r /proc/loadavg ]; then
	awk '{printf "1 min: %s | 5 min: %s | 15 min: %s \n", $1, $2, $3}' /proc/loadavg
else
	LC_ALL=C uptime | awk -F'[lL]oad average[s]*:' '{printf "1, 5, 15 min: %s \n", $2}'
fi
