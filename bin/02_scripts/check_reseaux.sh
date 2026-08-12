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

while IFS=';' read -r name target port || [[ -n "$name" ]]; do

	name=$(echo "$name" | xargs)
	target=$(echo "$target" | xargs)
	port=$(echo "$port" | xargs)

	if [[ -z "$name" || "$name" =~ ^# ]]; then
		continue
	fi

	(( total_services++ ))

	if [[ "$port" == "PING" ]]; then
		if ping -c 2 -W 2 "$target" &>/dev/null; then
			(( services_online++ ))
		echo -e "$name ($target:$port) -> ${COLOR_GREEN}[ONLINE]${COLOR_RESET}"
	else
			(( services_offline++ ))
		echo -e "$name ($target:$port) -> ${COLOR_RED}[OFFLINE]${COLOR_RESET}"
	fi
fi

done < "$CONF_FILE"
