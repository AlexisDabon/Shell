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
