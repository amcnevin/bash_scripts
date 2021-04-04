#!/bin/bash
######################################################
# wrap_in_quotes
# script that reads an input file and postures for a
# sql in clause or a csv file for processing.
#
# usage: wrap_in_quotes -f <filename>
#
######################################################

while getopts f: flag
do
    case "${flag}" in
        f) filename=${OPTARG};;
    esac
done
last_line=$(wc -l < "$filename")
current_line=0

while IFS= read -r line
do
  current_line=$(($current_line + 1))
  if [ $current_line -ne ${last_line} ]; then 
    echo "'$line',"
  else
    echo "'$line'"
  fi 
done < "$filename"
