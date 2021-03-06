#!/bin/bash

# <--1-->
# <--Move matching date files to Dealer_Analysis folder--> 
# <--Execute in Dealer_Schedules_0310 folder-->
find -type f \( -iname '*0310*' -o -iname '*0312*' -o -iname '*0315*' \) -exec mv -t /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis {} +

# <--2-->
# <--Move matching date files to Player_Analysis folder-->
# <--Execute in Roulette_Player_WinLoss_0310 folder-->
find -type f \( -iname '*0310*' -o -iname '*0312*' -o -iname '*0315*' \) -exec mv -t /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis {} +

# <--3-->
# <--Isolate and analyse data in Player_Analysis folder (TIMES-PAYERS-COUNT) send output to Notes_Player_Analysis-->
# <--Execute in Player_Analysis folder-->
grep - * > Roulette_Losses
awk '{print $1,$2}'  Roulette_Losses > Notes_Player_Analysis
grep Mylie Roulette_Losses | wc -l >> Notes_Player_Analysis

# <--4-->
# <--Separate the data in the Notes_Player_Analysis (TIMES-OF-LOSSESS) by days. Save and name by date in different files in new folder SupportFiles--> 
# <--Execute in any folder-->
# <--Create new folder-->
mkdir /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/supportFiles
# <--For day 0310-->
awk '{print $1,$2}' FS='_win_loss_player_data:' /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/Notes_Player_Analysis | sed '$d' | sed '$d'| grep 0310 | awk '{print $2,$3}' > /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/supportFiles/0310
# <--For day 0312-->
awk '{print $1,$2}' FS='_win_loss_player_data:' /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/Notes_Player_Analysis | sed '$d' | sed '$d'| grep 0312 | awk '{print $2,$3}' > /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/supportFiles/0312
# <--For day 0315-->
awk '{print $1,$2}' FS='_win_loss_player_data:' /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/Notes_Player_Analysis | sed '$d' | sed '$d'| grep 0315 | awk '{print $2,$3}' > /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/supportFiles/0315

# <--5-->
# <--Compare the times with dealers. Save output in Dealers_working_during_losses file-->
# <--Excecute in Dealer_Analysis folder-->
grep -f /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/supportFiles/0310 0310_Dealer_schedule | awk '{print $1,$2,$5,$6}' > Dealers_working_during_losses
grep -f /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/supportFiles/0312 0312_Dealer_schedule | awk '{print $1,$2,$5,$6}' >> Dealers_working_during_losses
grep -f /home/sysadmin/Documents/cyberclasswork/week3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/supportFiles/0315 0315_Dealer_schedule | awk '{print $1,$2,$5,$6}' >> Dealers_working_during_losses

# <--6-->
# <--Record dealer and times in Notes_Dealer_Analysis-->
# <--Excecute in Dealer_Analysis folder-->
echo Billy Jones >> Notes_Dealer_Analysis
cat  Dealers_working_during_losses | wc -l >> Notes_Dealer_Analysis