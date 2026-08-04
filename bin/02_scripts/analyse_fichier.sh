#!/bin/bash
#set -euo pipefail

if (( $# != 2 )); then
	echo "Usage $0 <chemin_fichier> <lignes_max>" >&2
	exit 1
fi

readonly CHEMIN_FICHIER="$1"
readonly LIGNES_MAX="$2"

if [[ ! "$LIGNES_MAX" =~ ^[1-9][0-9]*$ ]]; then
	echo "Erreur: Le nombre maximum de lignes doit être un entier positif." >&2
	exit 1 
fi
