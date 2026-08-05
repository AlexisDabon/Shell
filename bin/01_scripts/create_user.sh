#!/bin/bash
set -euo pipefail

if (( $# != 2 )); then
	echo "Usage $0 <nom_utilisateur> <age>" >&2
	exit 1
fi

readonly USERNAME="$1"
readonly AGE="$2"

if [[ ! "$AGE" =~ ^[1-9][0-9]*$ ]]; then
	echo "Le nombre doit être un entier positif" >&2
	exit 1
fi

echo "Succès : Utilisateur $USERNAME ($AGE ans) créé avec succès !"
