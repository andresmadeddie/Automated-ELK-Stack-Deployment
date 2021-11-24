#!/bin/bash
read -p "input date(MMDD): " date
read -p "input time(HH:MM:SS AM/FM): " t
read -p "enter letter game(b for BlackJack / r for Roulette / t for TexasHoldE): " g
echo
if [ $g == 'b' ]; then
cat "$date"_Dealer_schedule | awk '{print $1, $2, $3, $4}' | grep "$t"
elif [ $g == 'r' ]; then
cat "$date"_Dealer_schedule | awk '{print $1, $2, $5, $6}' | grep "$t"
elif [ $g == 't' ]; then 
cat "$date"_Dealer_schedule | awk '{print $1, $2, $7, $8}' | grep "$t"
else
echo wrong game input
fi
