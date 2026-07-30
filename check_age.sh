#!/bin/bash

MAJORITE=18

while true; do
	read -p "Quel âge avez vous ? " AGE

	if [[ "$AGE" =~ ^[0-9]+$ ]]; then
		break;
	else
		echo "Veuillez saisir un âge correct";
	fi
done
	if [ "$AGE" -ge "$MAJORITE" ]; then
		echo "Vous êtes majeur"
	else
		echo "Vous êtes mineur"
	fi
