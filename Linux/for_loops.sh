#!/usr/bin/env bash

state_list=(
	"Pennsylvania"
	"Virginia"
	"Maryland"
	"Hawaii"
	"New York"
)

for state in ${state_list[@]};
do
	if [ $state=='Hawaii' ]
	then
		echo "Hawaii is the best!"
		break
	else
		echo "I'm not fond of Hawaii."
	fi
done
