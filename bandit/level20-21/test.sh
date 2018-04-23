#!/bin/bash

input=
pwd='abc'
while [ "$input" == "$pwd" ]; do
    nc -l 30001 > file.txt
    input=$( cat file.txt | head -n 1 )
    #read input
    echo $input
done
echo 'correct'
