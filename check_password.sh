#!/bin/bash
echo "entrez le mot de passe :"
read SECRET
if [ "$SECRET" = "1234" ]; then
	echo "accès autorisé ."
else 
	echo "accès refusé ."
fi

