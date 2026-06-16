#!/bin/bash
echo "Quel âge as tu ?" 
read AGE 
if [ $AGE -ge 18 ]; then 
	echo "Accès autorisé"
else 
	echo "Accès refusé"
fi
