library(dplyr)
library(ggplot2)
#The objective of this code is represent graphically the evolution of the ratio
#of games that are won when a team is playing at home, starting in 1950.

#For each decade, we take only the matches that were not played on a neutral place. 
matchs50s = filter(Foot_Results, year >= 1950 & year < 1960 & neutral == 0)
matchs60s = filter(Foot_Results, year >= 1960 & year < 1970 & neutral == 0)
matchs70s = filter(Foot_Results, year >= 1970 & year < 1980 & neutral == 0)
matchs80s = filter(Foot_Results, year >= 1980 & year < 1990 & neutral == 0)
matchs90s = filter(Foot_Results, year >= 1990 & year < 2000 & neutral == 0)
matchs00s = filter(Foot_Results, year >= 2000 & year < 2010 & neutral == 0)
matchs10s = filter(Foot_Results, year >= 2010 & year < 2020 & neutral == 0)

#For each decade we count the number of matches where the home team won.
HomeWin50s = count(filter(matchs50s, home_score > away_score))
HomeWin60s = count(filter(matchs60s, home_score > away_score))
HomeWin70s = count(filter(matchs70s, home_score > away_score))
HomeWin80s = count(filter(matchs80s, home_score > away_score))
HomeWin90s = count(filter(matchs90s, home_score > away_score))
HomeWin00s = count(filter(matchs00s, home_score > away_score))
HomeWin10s = count(filter(matchs10s, home_score > away_score))

#Finally the ratio per decade
ratio50s = 100*HomeWin50s[[1]]/count(matchs50s)[[1]]
ratio60s = 100*HomeWin60s[[1]]/count(matchs60s)[[1]]
ratio70s = 100*HomeWin70s[[1]]/count(matchs70s)[[1]]
ratio80s = 100*HomeWin80s[[1]]/count(matchs80s)[[1]]
ratio90s = 100*HomeWin90s[[1]]/count(matchs90s)[[1]]
ratio00s = 100*HomeWin00s[[1]]/count(matchs00s)[[1]]
ratio10s = 100*HomeWin10s[[1]]/count(matchs10s)[[1]]

#Grouping of the ratios and the decades names
ratios = c(ratio50s, ratio60s, ratio70s, ratio80s, ratio90s, ratio00s, ratio10s)
Decades = c("1950s", "1960s", "1970s", "1980s", "1990s", "2000s", "2010s")

#Creation of a new dataset combining the decades and their ratios
newDS = data.frame(ratios, Decades)

#Graphic analysis
ggplot(data = newDS["ratios"], aes(x= Decades, y=ratios, fill = Decades)) + geom_col() + 
  geom_text(aes(label = sprintf("%0.2f", round(ratios, digits = 2))),
            vjust=1.6, color="black", fontface = "bold", size=4) +
  xlab("Decades") +  
  ylab("Home Wins ratio (%)") + 
  ggtitle("Home Wins ratio over decades") +
  theme(plot.title = element_text(hjust = 0.5))

