#!/bin/bash

if [ $# -ne 2 ]; then
	echo "usage $0 <nom_utilisateur> <age>"
	exit 1
fi

USERNAME=$1
AGE=$2

if [ "$AGE" -le 0 ] 2>/dev/null; then
	echo "Le nombre doit être un entier positif"
	exit 1
fi

echo "Succès : Utilisateur $USERNAME ($AGE ans) créé avec succès !"
