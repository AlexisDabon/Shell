#!/bin/bash

REPONSE=""

while [[ "$REPONSE" != "o" && "$REPONSE" != "n" ]]; do
	read -p "voulez vous installer la mise à jour ? o/n" REPONSE
done

if [[ "$REPONSE" == o ]]; then
	echo "installation de la mise à jour"
else
	echo "installation refusé"
fi
