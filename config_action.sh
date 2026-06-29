#!/bin/bash

REPONSE=""

while [[ "$REPONSE" != "o" && "$REPONSE" != "n" ]]; do
	read -p "voulez vous installer la mise à jour ? o/n" REPONSE
done
