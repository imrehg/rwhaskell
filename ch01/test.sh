#!/bin/bash

INPUT=$1
echo "Haskell:"
runghc TC < $INPUT
echo "wc:"
wc -m -w -l < $INPUT