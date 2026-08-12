#!/bin/bash
set -euo pipefail

if (( $# != 1 )); then
	echo "Erreur: Mauvais nombre d'arguments." >&2
	echo "Usage: $0 <fichier_configuration>" >&2
	exit 1
fi

readonly CONF_FILE="$1"

if ! [[ -f "$CONF_FILE" && -r "$CONF_FILE" ]]; then
	echo "Erreur le fichier '$CONF_FILE' n'existe pas ou est inaccessible." >&2
	exit 1
fi

readonly COLOR_RED=$'\e[31m'
readonly COLOR_GREEN=$'\e[32m'
readonly COLOR_RESET=$'\e[0m'

total_services=0
services_online=0
services_offline=0


