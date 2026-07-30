#!/bin/bash
set -euo pipefail

read -sp "Entrez le mot de passe : " secret
	echo ""

if [ "$secret" = "1234" ]; then
	echo "Accès autoisé"
else
	echo "Accès refusé"
	exit 1
fi
