library(dplyr)
library(ggplot2)
#The objective of this code is to represent, graphically, if the home win
#ratio was smaller in 2020 with most of the matches played without any
#fan. The comparison will be made with the last ten years.

#For each year, we take only the matches that were not played on a neutral place. 
matchs2011 = filter(Foot_Results, year == 2011 & neutral == 0)
matchs2012 = filter(Foot_Results, year == 2012 & neutral == 0)
matchs2013 = filter(Foot_Results, year == 2013 & neutral == 0)
matchs2014 = filter(Foot_Results, year == 2014 & neutral == 0)
matchs2015 = filter(Foot_Results, year == 2015 & neutral == 0)
matchs2016 = filter(Foot_Results, year == 2016 & neutral == 0)
matchs2017 = filter(Foot_Results, year == 2017 & neutral == 0)
matchs2018 = filter(Foot_Results, year == 2018 & neutral == 0)
matchs2019 = filter(Foot_Results, year == 2019 & neutral == 0)
matchs2020 = filter(Foot_Results, year == 2020 & neutral == 0)

#For each decade we count the number of matches where the home team won.
HomeWin2011 = count(filter(matchs2011, home_score > away_score))
HomeWin2012 = count(filter(matchs2012, home_score > away_score))
HomeWin2013 = count(filter(matchs2013, home_score > away_score))
HomeWin2014 = count(filter(matchs2014, home_score > away_score))
HomeWin2015 = count(filter(matchs2015, home_score > away_score))
HomeWin2016 = count(filter(matchs2016, home_score > away_score))
HomeWin2017 = count(filter(matchs2017, home_score > away_score))
HomeWin2018 = count(filter(matchs2018, home_score > away_score))
HomeWin2019 = count(filter(matchs2019, home_score > away_score))
HomeWin2020 = count(filter(matchs2020, home_score > away_score))

#Finally the ratio per decade
ratio2011 = 100*HomeWin2011[[1]]/count(matchs2011)[[1]]
ratio2012 = 100*HomeWin2012[[1]]/count(matchs2012)[[1]]
ratio2013 = 100*HomeWin2013[[1]]/count(matchs2013)[[1]]
ratio2014 = 100*HomeWin2014[[1]]/count(matchs2014)[[1]]
ratio2015 = 100*HomeWin2015[[1]]/count(matchs2015)[[1]]
ratio2016 = 100*HomeWin2016[[1]]/count(matchs2016)[[1]]
ratio2017 = 100*HomeWin2017[[1]]/count(matchs2017)[[1]]
ratio2018 = 100*HomeWin2018[[1]]/count(matchs2018)[[1]]
ratio2019 = 100*HomeWin2019[[1]]/count(matchs2019)[[1]]
ratio2020 = 100*HomeWin2020[[1]]/count(matchs2020)[[1]]

#Grouping of the ratios and the decades names
ratios2010s = c(ratio2011, ratio2012, ratio2013, ratio2014, ratio2015, ratio2016, ratio2017, ratio2018, ratio2019, ratio2020)
years = c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020")
#Creation of a new dataset combining the decades and their ratios
newDS2 = data.frame(ratios2010s, years) 

# #Graphic analysis
ggplot(data = newDS2["ratios2010s"], aes(x= years, y=ratios2010s, fill=years)) + geom_col() +
  geom_text(aes(label = sprintf("%0.2f", round(ratios2010s, digits = 2))),
            vjust=1.6, color="black", fontface = "bold", size=4) +
  xlab("Years") +
  ylab("Home Wins ratio (%)") +
  ggtitle("Home Wins ratio in the last decade") +
  theme(plot.title = element_text(hjust = 0.5))

