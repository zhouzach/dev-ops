#!/bin/bash

# https://linuxize.com/post/how-to-compare-strings-in-bash/

VAR1="Linuxize"
VAR2="Linuxize"

if [ "$VAR1" = "$VAR2" ]; then
    echo "Strings are equal."
else
    echo "Strings are not equal."
fi




read -p "Enter first string: " VAR1
read -p "Enter second string: " VAR2

if [[ "$VAR1" == "$VAR2" ]]; then
    echo "Strings are equal."
else
    echo "Strings are not equal."
fi

