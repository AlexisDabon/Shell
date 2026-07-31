#!/bin/bash
set -euo pipefail

while true; do
	if ! read -r -p "Installation de la mise à jour ? (o/n) : " REPONSE; then
	echo -e "\n Saisie annulée" >&2
	exit 1
	fi

	REPONSE="${REPONSE,,}"

	if [[ "$REPONSE" =~ ^(o|oui|n|non)$ ]]; then
	break
	fi

	echo "Repondre par 'o' ou 'n'" >&2
done

if [[ "$REPONSE" =~ ^(o|oui)$ ]]; then
	echo "Installation de la mise à jour"
else
	echo "Installation refusée"
fi
