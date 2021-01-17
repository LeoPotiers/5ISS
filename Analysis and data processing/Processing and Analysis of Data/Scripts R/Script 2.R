library(dplyr)
library(ggplot2)

#Filtering friendly and competitive games
FriendlyGames <-filter(foot_results, tournament =="Friendly")
CompetitiveGames <-filter(foot_results, tournament !="Friendly")

###1900s###
#Filtering games of the 1900s decade
FriendlyGames1900s<-filter(FriendlyGames, year>=1900 & year<1910)
CompetitiveGames1900s<-filter(CompetitiveGames, year>=1900 & year<1910)

#Renaming the "year" column to display it correctly
FriendlyGames1900s[,"year"]="1900s"
CompetitiveGames1900s[,"year"]="1900s"

#Counting the number of friendly games, and of competitive ones
NbFriendlyGames1900s<-count(FriendlyGames1900s, FriendlyGames1900s[,"year"])
NbCompetitiveGames1900s<-count(CompetitiveGames1900s, CompetitiveGames1900s[,"year"])

#Creating a table with the count, year, and type of game
table <- rbind(NbFriendlyGames1900s, NbCompetitiveGames1900s)
table$Type_of_game=c("Friendly", "Competitive")

###1910s###

FriendlyGames1910s<-filter(FriendlyGames, year>=1910 & year<1920)
CompetitiveGames1910s<-filter(CompetitiveGames, year>=1910 & year<1920)

FriendlyGames1910s[,"year"]="1910s"
CompetitiveGames1910s[,"year"]="1910s"

NbFriendlyGames1910s<-count(FriendlyGames1910s, FriendlyGames1910s[,"year"])
NbCompetitiveGames1910s<-count(CompetitiveGames1910s, CompetitiveGames1910s[,"year"])


table2 <- rbind(NbFriendlyGames1910s, NbCompetitiveGames1910s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)

###1920s###

FriendlyGames1920s<-filter(FriendlyGames, year>=1920 & year<1930)
CompetitiveGames1920s<-filter(CompetitiveGames, year>=1920 & year<1930)

FriendlyGames1920s[,"year"]="1920s"
CompetitiveGames1920s[,"year"]="1920s"

NbFriendlyGames1920s<-count(FriendlyGames1920s, FriendlyGames1920s[,"year"])
NbCompetitiveGames1920s<-count(CompetitiveGames1920s, CompetitiveGames1920s[,"year"])


table2 <- rbind(NbFriendlyGames1920s, NbCompetitiveGames1920s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)

###1930s###

FriendlyGames1930s<-filter(FriendlyGames, year>=1930 & year<1940)
CompetitiveGames1930s<-filter(CompetitiveGames, year>=1930 & year<1940)

FriendlyGames1930s[,"year"]="1930s"
CompetitiveGames1930s[,"year"]="1930s"

NbFriendlyGames1930s<-count(FriendlyGames1930s, FriendlyGames1930s[,"year"])
NbCompetitiveGames1930s<-count(CompetitiveGames1930s, CompetitiveGames1930s[,"year"])


table2 <- rbind(NbFriendlyGames1930s, NbCompetitiveGames1930s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)

###1940s###

FriendlyGames1940s<-filter(FriendlyGames, year>=1940 & year<1950)
CompetitiveGames1940s<-filter(CompetitiveGames, year>=1940 & year<1950)

FriendlyGames1940s[,"year"]="1940s"
CompetitiveGames1940s[,"year"]="1940s"

NbFriendlyGames1940s<-count(FriendlyGames1940s, FriendlyGames1940s[,"year"])
NbCompetitiveGames1940s<-count(CompetitiveGames1940s, CompetitiveGames1940s[,"year"])


table2 <- rbind(NbFriendlyGames1940s, NbCompetitiveGames1940s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)

###1950s###

FriendlyGames1950s<-filter(FriendlyGames, year>=1950 & year<1960)
CompetitiveGames1950s<-filter(CompetitiveGames, year>=1950 & year<1960)

FriendlyGames1950s[,"year"]="1950s"
CompetitiveGames1950s[,"year"]="1950s"

NbFriendlyGames1950s<-count(FriendlyGames1950s, FriendlyGames1950s[,"year"])
NbCompetitiveGames1950s<-count(CompetitiveGames1950s, CompetitiveGames1950s[,"year"])


table2 <- rbind(NbFriendlyGames1950s, NbCompetitiveGames1950s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)

###1960s###

FriendlyGames1960s<-filter(FriendlyGames, year>=1960 & year<1970)
CompetitiveGames1960s<-filter(CompetitiveGames, year>=1960 & year<1970)

FriendlyGames1960s[,"year"]="1960s"
CompetitiveGames1960s[,"year"]="1960s"

NbFriendlyGames1960s<-count(FriendlyGames1960s, FriendlyGames1960s[,"year"])
NbCompetitiveGames1960s<-count(CompetitiveGames1960s, CompetitiveGames1960s[,"year"])


table2 <- rbind(NbFriendlyGames1960s, NbCompetitiveGames1960s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)

###1970s###

FriendlyGames1970s<-filter(FriendlyGames, year>=1970 & year<1980)
CompetitiveGames1970s<-filter(CompetitiveGames, year>=1970 & year<1980)

FriendlyGames1970s[,"year"]="1970s"
CompetitiveGames1970s[,"year"]="1970s"

NbFriendlyGames1970s<-count(FriendlyGames1970s, FriendlyGames1970s[,"year"])
NbCompetitiveGames1970s<-count(CompetitiveGames1970s, CompetitiveGames1970s[,"year"])


table2 <- rbind(NbFriendlyGames1970s, NbCompetitiveGames1970s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)

###1980s###

FriendlyGames1980s<-filter(FriendlyGames, year>=1980 & year<1990)
CompetitiveGames1980s<-filter(CompetitiveGames, year>=1980 & year<1990)

FriendlyGames1980s[,"year"]="1980s"
CompetitiveGames1980s[,"year"]="1980s"

NbFriendlyGames1980s<-count(FriendlyGames1980s, FriendlyGames1980s[,"year"])
NbCompetitiveGames1980s<-count(CompetitiveGames1980s, CompetitiveGames1980s[,"year"])


table2 <- rbind(NbFriendlyGames1980s, NbCompetitiveGames1980s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)

###1990s###

FriendlyGames1990s<-filter(FriendlyGames, year>=1990 & year<2000)
CompetitiveGames1990s<-filter(CompetitiveGames, year>=1990 & year<2000)

FriendlyGames1990s[,"year"]="1990s"
CompetitiveGames1990s[,"year"]="1990s"

NbFriendlyGames1990s<-count(FriendlyGames1990s, FriendlyGames1990s[,"year"])
NbCompetitiveGames1990s<-count(CompetitiveGames1990s, CompetitiveGames1990s[,"year"])


table2 <- rbind(NbFriendlyGames1990s, NbCompetitiveGames1990s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)

###2000s###

FriendlyGames2000s<-filter(FriendlyGames, year>=2000 & year<2010)
CompetitiveGames2000s<-filter(CompetitiveGames, year>=2000 & year<2010)

FriendlyGames2000s[,"year"]="2000s"
CompetitiveGames2000s[,"year"]="2000s"

NbFriendlyGames2000s<-count(FriendlyGames2000s, FriendlyGames2000s[,"year"])
NbCompetitiveGames2000s<-count(CompetitiveGames2000s, CompetitiveGames2000s[,"year"])


table2 <- rbind(NbFriendlyGames2000s, NbCompetitiveGames2000s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)

###2010s###

FriendlyGames2010s<-filter(FriendlyGames, year>=2010 & year<2020)
CompetitiveGames2010s<-filter(CompetitiveGames, year>=2010 & year<2020)

FriendlyGames2010s[,"year"]="2010s"
CompetitiveGames2010s[,"year"]="2010s"

NbFriendlyGames2010s<-count(FriendlyGames2010s, FriendlyGames2010s[,"year"])
NbCompetitiveGames2010s<-count(CompetitiveGames2010s, CompetitiveGames2010s[,"year"])


table2 <- rbind(NbFriendlyGames2010s, NbCompetitiveGames2010s)
table2$Type_of_game=c("Friendly", "Competitive")
table <- rbind(table,table2)


###PLOT###


p<-ggplot(data=table, aes(x=year, y=n, fill=Type_of_game))

#We choose the style of plot
p<- p + geom_bar(stat="identity")

#We rename the x-axis
p<- p + xlab("Decades")

#We rename the y-axis
p<- p + ylab("Number of games")

#We change the name of the legend
p<- p + labs(fill = "Type of game")

#We change the title of the graph
p<- p + ggtitle("Evolution of the number of competitive and friendly international soccer games since 1900")

#We center the title on the graph
p<- p + theme(plot.title = element_text(hjust = 0.5))

#And we final print it
print(p)
