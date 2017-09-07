#!/bin/bash

#Check watchlist.txt and scrape the release date info from
#thefutoncritic.com, consequently, if any changes, send notification to user

#Get html from website
curl -sL http://www.thefutoncritic.com/guide/when-does-insert-show-name-here-come-back/ > thefutoncritic.html
lynx -dump thefutoncritic.html > futontext.txt


#string to put between show and date info
between=" --- "

#iterate over all lines in watchlist
cat $HOME/watchlist.txt | while read line 
do
#checks if "between" is in line, indicating it already has a date
if grep -q "$between" <<< "$line"; then
	continue


#if no date set, scrape and append it to line
else
	#grabs line, extract date
	date=$(grep -i -m 1 "$line" futontext.txt | grep -Eo '[[:digit:]]{1,2}/[[:digit:]]{1,2}/[[:digit:]]{1,2}')
	if [ "$date" != "" ]; then
		sed -i '' "s%$line%$line$between$date%g" $HOME/watchlist.txt
	fi

fi


done