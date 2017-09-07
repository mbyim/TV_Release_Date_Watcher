# TV Release Date Watcher

(This is my first real attempt at bash scripting. I realized how useful the commandline could be, but had very little experience with it. Here, I tried to make something useful with bash to see if I could learn a few things.)

Two bash scripts that allow you to maintain and update a "watchlist". Using managewatchlist.sh, a user can add or remove shows to the watchlist, and view/print the watchlist.

The showdatedatacollector.sh can be put in a cron job to continously check the watchlist, and update the watchlist with new dates as they are scraped from the website being used for data-gathering (thefutoncritic.com).

As of right now, I haven't added any passive notification via email, but that would definitely increase the utility of this script (eg: If release date is 7 days away, send email notification to user's email).

