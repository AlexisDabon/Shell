#!/bin/bash
set -euo pipefail

HOST_NAME=$(hostname)
SYS_KERNEL=$(uname -sr)
CLEAN_UPTIME=$(uptime -p | sed 's/^up //')
