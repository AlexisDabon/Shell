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

echo "================================================================="
echo " Rapport de vérification des services - $(date '+%Y-%m-%d %H:%M:%S')"
echo "================================================================="
printf "%-25s %-20s %-10s %s\n" "NOM" "CIBLE" "PORT" "STATUT"
echo "-----------------------------------------------------------------"

while IFS=';' read -r name target port || [[ -n "$name" ]]; do

	name=$(echo "$name" | xargs)
	target=$(echo "$target" | xargs)
	port=$(echo "$port" | xargs)

	if [[ -z "$name" || "$name" =~ ^# ]]; then
		continue
	fi

	(( ++total_services ))

	is_online=0

	if [[ "$port" == "PING" ]]; then
		if ping -c 2 -W 2 "$target" &>/dev/null; then
			is_online=1
		fi
	else
		if timeout 2 bash -c "exec 3<>/dev/tcp/$target/$port" &>/dev/null; then
			is_online=1
	fi
fi

	if (( is_online == 1 )); then
		(( ++services_online ))
		status="${COLOR_GREEN}ONLINE${COLOR_RESET}"
	else
		(( ++services_offline ))
		status="${COLOR_RED}OFFLINE${COLOR_RESET}"
	fi

	printf "%-25s %-20s %-10s [%b]\n" "$name" "$target" "$port" "$status"

done < "$CONF_FILE"

echo "-----------------------------------------------------------------"
echo "BILAN DE L'ANALYSE :"
echo "  - Total de tests effectués : $total_services"
echo "  - Services en ligne        : $services_online"
echo "  - Services hors ligne      : $services_offline"
echo "================================================================="

if (( services_offline > 0 )); then
	exit 3
fi

exit 0
