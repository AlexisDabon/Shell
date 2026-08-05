#!/bin/bash
set -euo pipefail

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

if [[ ! -f "$CHEMIN_FICHIER" ]]; then
	echo "Erreur: Le chemin '$CHEMIN_FICHIER' n'existe pas." >&2
	exit 2
fi

readonly NB_LIGNES=$(wc -l < "$CHEMIN_FICHIER")

if (( $NB_LIGNES > $LIGNES_MAX )); then
	echo "Avertissement: Le fichier contient $NB_LIGNES lignes, ce qui dépasse la limite autorisée de $LIGNES_MAX" >&2
	exit 3
else
	echo "Fichier conforme ($NB_LIGNES / $LIGNES_MAX lignes)"
fi
