Footy <- read.csv("Championship.csv", header = TRUE, sep = ",")
library(ggplot2)

library(ggalt)
library(dplyr)
library(data.table)

#Extracts the max and min average odds for home teams, and groups by the Home Team
Dumb_df <- Footy %>%
  group_by(HomeTeam) %>%
  summarise(Avmax=max(BbAvH), Avmin=min(BbAvH))

#Adds new column to DF, then adds Final league position for each team
Dumb_df <- mutate(Dumb_df, FinalPos=rownames(Dumb_df))
setDT(Dumb_df)[HomeTeam =="Wolves", FinalPos:= "1"]
setDT(Dumb_df)[HomeTeam=="Cardiff", FinalPos:="2"]
setDT(Dumb_df)[HomeTeam=="Fulham", FinalPos:="3"]
setDT(Dumb_df)[HomeTeam=="Aston Villa", FinalPos:="4"]
setDT(Dumb_df)[HomeTeam=="Middlesbrough", FinalPos:="5"]
setDT(Dumb_df)[HomeTeam=="Derby", FinalPos:="6"]
setDT(Dumb_df)[HomeTeam=="Preston", FinalPos:="7"]
setDT(Dumb_df)[HomeTeam=="Millwall", FinalPos:="8"]
setDT(Dumb_df)[HomeTeam=="Brentford", FinalPos:="9"]
setDT(Dumb_df)[HomeTeam=="Sheffield United", FinalPos:="10"]
setDT(Dumb_df)[HomeTeam=="Bristol City", FinalPos:="11"]
setDT(Dumb_df)[HomeTeam=="Ipswich", FinalPos:="12"]
setDT(Dumb_df)[HomeTeam=="Leeds", FinalPos:="13"]
setDT(Dumb_df)[HomeTeam=="Norwich", FinalPos:="14"]
setDT(Dumb_df)[HomeTeam=="Sheffield Weds", FinalPos:="15"]
setDT(Dumb_df)[HomeTeam=="QPR", FinalPos:="16"]
setDT(Dumb_df)[HomeTeam=="Nott'm Forest", FinalPos:="17"]
setDT(Dumb_df)[HomeTeam=="Hull", FinalPos:="18"]
setDT(Dumb_df)[HomeTeam=="Birmingham", FinalPos:="19"]
setDT(Dumb_df)[HomeTeam=="Reading", FinalPos:="20"]
setDT(Dumb_df)[HomeTeam=="Bolton", FinalPos:="21"]
setDT(Dumb_df)[HomeTeam=="Barnsley", FinalPos:="22"]
setDT(Dumb_df)[HomeTeam=="Burton", FinalPos:="23"]
setDT(Dumb_df)[HomeTeam=="Sunderland", FinalPos:="24"]

#Converts final position character into numeric
Dumb_df$FinalPos <- as.numeric(as.character(Dumb_df$FinalPos))

#Sorts teams into final position 
Dumb_df <- Dumb_df[order(FinalPos),]
Dumb_df$HomeTeam <- factor(Dumb_df$HomeTeam, as.character(Dumb_df$HomeTeam))

#Plots Dumbell chart
gg <- ggplot(Dumb_df, aes(x=Dumb_df$Avmax, xend= Dumb_df$Avmin, y = Dumb_df$HomeTeam))
gg <- gg + geom_dumbbell(colour="#686868",
                         colour_x = "dark red",
                         colour_xend ="#0000ff",
                         size_x = 2.5,
                         size_xend = 2.5)
gg <- gg + scale_y_discrete(limits = rev(levels(as.factor(Dumb_df$HomeTeam))))
gg <- gg + labs(x="Average Home Win Odds", y = NULL, title = "Did the Bookies get it Right?", caption = "Data from football-data.co.uk")
gg <- gg + theme_bw()
gg <- gg + theme(axis.ticks=element_blank())
gg <- gg + theme(panel.grid.minor=element_blank())
gg <- gg + theme(panel.border=element_blank())
gg <- gg + theme(axis.title.x=element_text(hjust=1, face="italic", margin=margin(t=-24)))
gg <- gg + theme(plot.caption=element_text(size=8, margin=margin(t=24)))
gg <- gg + theme(axis.text = element_text(colour = "black"))
gg

#Sorts by AVmin, adds final position for reference
Dumb_df <- Dumb_df[order(Avmin),]
Dumb_df$HomeTeam <- factor(Dumb_df$HomeTeam, as.character(Dumb_df$HomeTeam))
Dumb_df$HomeTeam <- paste(Dumb_df$HomeTeam, "(", Dumb_df$FinalPos,")")
