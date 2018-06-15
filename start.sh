#!/bin/bash

if [ $# -eq 0 ] 
then
    arg="last"
else
	arg="$1"
fi

DIRECTORY="output"
if [ ! -d "$DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  mkdir $DIRECTORY
fi
input=`ls dataset`

java -cp "code/*" weka.filters.supervised.attribute.AttributeSelection \
  -i dataset/$input -o output/output.csv -c "$arg" \
  -E "weka.attributeSelection.CfsSubsetEval -P 1 -E 1" \
  -S "weka.attributeSelection.BestFirst -D 1 -N 5" 
