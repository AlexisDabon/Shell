#!/bin/bash
set -euo pipefail
readonly MDP_CORRECT="1234"

if ! read -rsp "Entrez le mot de passe : " secret; then
	echo -e "\n Saisie annulée" >&2
	exit 1
fi

echo ""

if [[ "$secret" == "$MDP_CORRECT" ]]; then
	echo "Accès autorisé"
else
	echo "Accès refusé" >&2
	exit 1
fi
