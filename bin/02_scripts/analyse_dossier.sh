#!/bin/bash
set -euo pipefail

shopt -s nullglob

if (( $# != 2 )); then
	echo "Usage: $0 <chemin_dossier> <lignes_max>" >&2
	exit 1
fi

readonly CHEMIN_DOSSIER="$1"
readonly LIGNES_MAX="$2"

if [[ ! "$LIGNES_MAX" =~ ^[1-9][0-9]*$ ]]; then
	echo "Erreur le nombre de lignes max. doit être un entier positif" >&2
	exit 1
fi
