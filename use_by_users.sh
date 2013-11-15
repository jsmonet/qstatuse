#!/bin/bash
# This script returns the users and number of their jobs in descending order ranked by 
# number of jobs. Your output should resemble
# 39: username1
# 25: username2
# 1: username3
# If it isn't acting like that, I blame you.

function load_array(){
XYZ=($(qstat | grep -v "^job" | grep -v "^\-" | awk '{print$4}' | sort -g | uniq ))

for i in "${XYZ[@]}"
do
        sum=$( qstat | grep $i | wc -l )
        echo "$sum:$i" 
done
}

load_array | sort -rg

exit $?
