#!/bin/bash

cat $1_Dealer_schedule | awk -F" " '{print $1,$2,$5,$6}' | grep -iF "$2" | cut -c 13-

#Worked through the homework with Josh Vangor
