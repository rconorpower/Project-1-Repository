#!/bin/bash

#tput setaf 165; echo "Blackjack / Roulette / Texas Hold EM"
#tput sgr0; cat $1_Dealer_schedule | awk -F" " '{print $1,$2,$3,$4,$5,$6,$7,$8}' | grep -iF "$2" | cut -c 13-

if [ $3 = "Blackjack" ]
then
	tput setaf 165; echo "Blackjack"
	tput sgr0; cat $1_Dealer_schedule | awk -F" " '{print $1,$2,$3,$4}' | grep -iF "$2" | cut -c 13-

elif [ $3 = "Roulette" ]
then
	tput setaf 165; echo "Roulette"
	tput sgr0; cat $1_Dealer_schedule | awk -F" " '{print $1,$2,$5,$6}' | grep -iF "$2" | cut -c 13-

elif [ $3 = "Texas_Hold_EM" ]
then
	tput setaf 165; echo "Texas Hold EM"
	tput sgr0; cat $1_Dealer_schedule | awk -F" " '{print $1,$2,$7,$8}' | grep -iF "$2" | cut -c 13-

else
	tput setaf 165; echo "Blackjack"
        tput sgr0; cat $1_Dealer_schedule | awk -F" " '{print $1,$2,$3,$4}' | grep -iF "$2" | cut -c 13-
	tput setaf 165; echo "Roulette"
        tput sgr0; cat $1_Dealer_schedule | awk -F" " '{print $1,$2,$5,$6}' | grep -iF "$2" | cut -c 13-
	tput setaf 165; echo "Texas Hold EM"
        tput sgr0; cat $1_Dealer_schedule | awk -F" " '{print $1,$2,$7,$8}' | grep -iF "$2" | cut -c 13-
fi

#Variables:
#$1 =	Date:	mmdd
#$2 =	Time:	"hh:mm:ss AM/PM"
#$3 =	Game:	"Blackjack", "Roulette", "Texas_Hold_EM"


#Worked through the homework with Josh Vangor for initial commands
#ref site for if command:	https://www.tutorialspoint.com/unix/if-elif-statement.htm
#ref site for tput command:	https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
