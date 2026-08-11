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

	if [[ ! -d "$CHEMIN_DOSSIER" ]]; then	
		echo "Erreur "$CHEMIN_DOSSIER" n'existe pas." >&2
		exit 2
	fi

total_fichiers=0
fichier_non_conforme=0

	for fichier in "$CHEMIN_DOSSIER"/*; do
		if [[ -f "$fichier" ]]; then
			(( ++total_fichiers ))
			nb_lignes=$(wc -l < "$fichier")

		if (( nb_lignes > LIGNES_MAX )); then
			echo "[TROP LONG] $fichier ($nb_lignes / $LIGNES_MAX lignes)" >&2
			(( ++fichier_non_conforme ))
		else
			echo "[OK] $fichier ($nb_lignes / $LIGNES_MAX lignes)"
			fi	
		fi
	done

	echo "--- Analyse ---"

	if (( total_fichiers == 0 )); then
		echo "Aucun fichiers trouvés dans '$CHEMIN_DOSSIER'"
	else
		echo "Fichiers analysés: $total_fichiers"
		echo "Fichiers hors limite: $fichier_non_conforme"
	fi

	if (( fichier_non_conforme > 0 )); then
		exit 3
	fi
exit 0
