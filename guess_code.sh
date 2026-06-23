#!/bin/bash

CODE_CORRECT=31
ESSAI=0

while [ "$ESSAI" -ne "$CODE_CORRECT" ]; do
	echo "devinez le code secret :"
	read ESSAI

if [ "$ESSAI" -lt "$CODE_CORRECT" ]; then
	echo "C'est plus grand"

elif [ "$ESSAI" -gt "$CODE_CORRECT" ]; then
	echo "C'est plus petit"

else 
	echo "Bravo !"

fi

done


