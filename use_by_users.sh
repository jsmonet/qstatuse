#!/bin/bash

USER_ARRAY=($(qstat | grep -v "^job" | grep -v "^\-" | awk '{print$4}' | sort | uniq ))

for i in "${USER_ARRAY[@]}"
do
	sum=$( qstat | grep $i | wc -l )
	echo "$i: $sum"
done
