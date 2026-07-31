#!/bin/bash

readonly MAJORITE=18

while true; do
	if ! read -r -p "Quel âge avez vous ? " AGE; then
		echo -e "\n Saisie annulée " >&2
		exit 1
	fi

	if [[ "$AGE" =~ ^[0-9]+$ ]]; then
		break;
	fi
	echo "Veuillez saisir un âge correct" >&2
done
	
if (( AGE >= MAJORITE )); then
	echo "Vous êtes majeur"
else
	echo "Vous êtes mineur"
fi
