#!/bin/bash
set -euo pipefail

BLEU=$'\033[0;34m'
VERT=$'\033[0;32m'
GRAS=$'\033[1m'
RESET=$'\033[0m'

HOST_NAME=$(hostname)
SYS_KERNEL=$(uname -sr)
RAW_UPTIME=$(uptime -p)
CLEAN_UPTIME=${RAW_UPTIME#up }


