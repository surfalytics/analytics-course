#!/bin/bash
# example.sh

FILENAME="example.txt"

if [ -f "$FILENAME" ]; then
    echo "$FILENAME exists."
else
    echo "$FILENAME does not exist."
fi
