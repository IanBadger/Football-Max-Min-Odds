# Football-Max-Min-Odds
Dumbell Charts showing bookmaker maximum and minimum odds

Upon looking for free datasets with sports/football data, I came across www.football-data.co.uk. This site provides historical betting information from 22 European leagues going back to 1993/94. Files can be downloaded with each CSV containing data such as results, match stats and bookmaker odds. I downloaded complete data for the 2017/2018 English Championship season. Looking at the minimum and maximum odds for each teams’ results, I set out to create a dumbbell chart. By ordering teams in their finishing positions, it could provide a visualisation of whether the bookies had got the odds right. 

The data was wrangled in R and graphed using ggplot2 and ggalt. 

![dumbell plot](https://user-images.githubusercontent.com/42275367/47259645-59232280-d4a4-11e8-9ac5-b8475ec313fa.png)

So, did the bookies get it right? On the balance, probably just about. For the lowest minimum odds, the teams at the top had the lower odds, the teams that struggled had longer odds. There were a few obvious outliers worth mentioning, Ipswich outperformed what the bookies thought, and Burton should have finished rock bottom but actually put up a decent fight while Sunderland had a nightmare season. The maximum average odds were loss consistent, maybe as a result of bookmakers trying to entice punters in with bigger odds from time to time. 
Norwich performed worse than their odds suggested. Brentford had the tightest spread of odds, suggesting they maybe should have finished higher in the table. 

!(https://github.com/IanBadger/Football-Max-Min-Odds/blob/master/Dumbell%20Avg%20min%20order.png)
