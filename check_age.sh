#!/bin/bash

MAJORITE=18

while true; do
	read -p "Quel âge avez vous ?" AGE

	if [[ "$AGE" =~ ^[0-9]+$ ]]; then
		break;
	else 
		echo "Veuillez saisir un âge correct"; 
	fi
done
