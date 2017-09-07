#!/bin/bash

#In conjunction with showdatedatacollector.sh, which 
#updates release dates, this script allows you to manipulate
#and see the "watchlist" of TV shows you follow so you can
#see when they are renewed, and for what dates

#Note: put showdatedatacollector.sh in a cron job to automate
#checking for release dates

echo -----Show Release Date Monitoring System-----

echo "Press 1" to add a show to Watchlist, 2 to see the Watchlist, and 3 to remove a show
read var

#Add show to  "watchlist"
if [ $var = "1" ]; then
	read -p "Type Show Name: " show

	if grep -Fxq "$show" $HOME/watchlist.txt; then
		echo The Show is already on the Watchlist

	else
		#If watchlist does not exist yet, make it and append. Otherwise, append.
		if [ ! -e $HOME/watchlist.txt ]; then
		    echo $show | tr '[:lower:]' '[:upper:]' > $HOME/watchlist.txt
		else
		    echo $show | tr '[:lower:]' '[:upper:]' >> $HOME/watchlist.txt
		fi
	fi

#See watchlist
elif [ $var = "2" ]; then
	echo
	echo Watchlist:
	cat $HOME/watchlist.txt
	echo ---------------

#Remove show from watchlist
elif [ $var = "3" ]; then
	echo Type Show Name to Remove:
	read show
	show=$(echo $show| tr '[:lower:]' '[:upper:]')
	#echo $show
	grep -v "$show" $HOME/watchlist.txt > $HOME/tmpwatchlist.txt
	mv $HOME/tmpwatchlist.txt $HOME/watchlist.txt
	sed -i '' '/$show/d' $HOME/watchlist.txt

#Invalid Command
else
	echo Invalid Command 
	echo Try: 1 to add show, 2 to see watchlist, 3 to remove show


fi


 