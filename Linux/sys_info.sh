#!/bin/bash

#define variables
output=$HOME/research/sys_info.txt

echo "System Info" && echo | date "+DATE: %D%n"
echo | cat | uname

#S
lst=( "/etc/shadow" "/etc/passwd" )

for x in ${lst[@]};
do
	ls -lh $x
done
