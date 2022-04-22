#!/bin/bash

# Assign the filename
file="product.csv"

search="Chips"

replace="Clock"

if [[ $search != "" && $replace != "" ]]; then
sed -i "s/$search/$replace/" $file
fi
