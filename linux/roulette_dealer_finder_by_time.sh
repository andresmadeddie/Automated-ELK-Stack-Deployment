#!/bin/bash
read -p "input date(MMDD): " date
read -p "input time(HH:MM:SS AM/FM): " t
cat "$date"_Dealer_schedule | awk '{print $1, $2, $5, $6}' | grep "$t"
