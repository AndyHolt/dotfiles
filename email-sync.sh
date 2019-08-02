#!/bin/zsh
#
# File: email-sync.sh
# Description: Sync email accounts using offlineimap in parallel
# Author: Andy Holt
# Date: Tue 09 Jul 2019 17:20

start=`date +%s`

# run a separate offlineimap process for each account
offlineimap -a Hotmail -u quiet &
Photmail=$!

offlineimap -a Cantab -u quiet &
Pcantab=$!

offlineimap -a Gmail -u quiet &
Pgmail=$!

# wait for all processes to finish
wait $Photmail $Pcantab $Pgmail

end=`date +%s`
runtime=$((end-start))
echo "Finished email sync in $runtime seconds."
