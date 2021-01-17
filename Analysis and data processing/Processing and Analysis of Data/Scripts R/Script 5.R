library(ggplot2)
library(purrr)
#The objective of this code is to see how the best football teams in the world
#evolved from 1900 to 2020. These teams has been chosen because of their
#international reputation as well as the number of trophies they won.The 
#evolution of the total amount of goals each team scored during its history will
#be represented graphically.

#This part is dedicated to create an empty dataset for each country, containing
#for each year the number of goals they scored. For now, all the years for each
#country did not see any goal scored.
BestTeams <- c("Brazil", "Germany", "Italy", "Argentina", "France")
years2 <- 1872:2020
v <- c(0:149)
v <- replace(v, which(v > 0), 0)
length(v) <- length(years2)
BrazilGoals <- data.frame(years2, v)
GermanyGoals <- data.frame(years2, v)
ItalyGoals <- data.frame(years2, v)
ArgentinaGoals <- data.frame(years2, v)
FranceGoals <- data.frame(years2, v)

#Renaming of the columns for a clearer code later.
colnames(BrazilGoals)[colnames(BrazilGoals) == 'years2'] <- 'Year'
colnames(GermanyGoals)[colnames(GermanyGoals) == 'years2'] <- 'Year'
colnames(ItalyGoals)[colnames(ItalyGoals) == 'years2'] <- 'Year'
colnames(FranceGoals)[colnames(FranceGoals) == 'years2'] <- 'Year'
colnames(ArgentinaGoals)[colnames(ArgentinaGoals) == 'years2'] <- 'Year'

colnames(BrazilGoals)[colnames(BrazilGoals) == 'v'] <- 'Goals'
colnames(GermanyGoals)[colnames(GermanyGoals) == 'v'] <- 'Goals'
colnames(ItalyGoals)[colnames(ItalyGoals) == 'v'] <- 'Goals'
colnames(FranceGoals)[colnames(FranceGoals) == 'v'] <- 'Goals'
colnames(ArgentinaGoals)[colnames(ArgentinaGoals) == 'v'] <- 'Goals'


Ystart <- 1872
#This loop is used to analyze wether or not the match from the original dataset
#sees one of the 5 teams on the pitch. If it is the case, we are looking at the
#year of the match and augmenting the number of goals the team scored this
#particular year. Every time one of the 5 is recognized, we are looking for which
#one and if it was the away or home team, to attribute the number of goals
#accordingly.
for (i in 1:count(Foot_Results)[[1]]){
  if (Foot_Results[i,"home_team"] %in% BestTeams){
    if (Foot_Results[i,"home_team"][[1]] == "Brazil"){
      BrazilGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] <- BrazilGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] + Foot_Results[i,"home_score"][[1]]
      }
    else if (Foot_Results[i,"home_team"]=="Germany"){
      GermanyGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] <- GermanyGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] + Foot_Results[i,"home_score"][[1]]
      }
    else if (Foot_Results[i,"home_team"]=="Argentina"){
      ArgentinaGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] <- ArgentinaGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] + Foot_Results[i,"home_score"][[1]]
      }
    else if (Foot_Results[i,"home_team"]=="Italy"){
      ItalyGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] <- ItalyGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] + Foot_Results[i,"home_score"][[1]]
      }
    else{
      FranceGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] <- FranceGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] + Foot_Results[i,"home_score"][[1]]
      }
  }
  else if (Foot_Results[i,"away_team"] %in% BestTeams){
    if (Foot_Results[i,"away_team"][[1]] == "Brazil"){
      BrazilGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] <- BrazilGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] + Foot_Results[i,"away_score"][[1]]
    }
    else if (Foot_Results[i,"away_team"]=="Germany"){
      GermanyGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] <- GermanyGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] + Foot_Results[i,"away_score"][[1]]
    }
    else if (Foot_Results[i,"away_team"]=="Argentina"){
      ArgentinaGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] <- ArgentinaGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] + Foot_Results[i,"away_score"][[1]]
    }
    else if (Foot_Results[i,"away_team"]=="Italy"){
      ItalyGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] <- ItalyGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] + Foot_Results[i,"away_score"][[1]]
    }
    else{
      FranceGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] <- FranceGoals[Foot_Results[i,"year"][[1]]-Ystart+1,"Goals"] + Foot_Results[i,"away_score"][[1]]
    }
  }
}

#This loop creates a new column for each team dataset to have the total amount
#of goals at every year. This is going to be really useful later. We are deleting
#the column that contain the number of goal per year since it will not be useful.
for (i in 1:(2020-Ystart+1)){
  BrazilGoals[i,"TotalGoals"] <- sum(BrazilGoals[1:i,"Goals"])
  GermanyGoals[i,"TotalGoals"] <- sum(GermanyGoals[1:i,"Goals"])
  ArgentinaGoals[i,"TotalGoals"] <- sum(ArgentinaGoals[1:i,"Goals"])
  ItalyGoals[i,"TotalGoals"] <- sum(ItalyGoals[1:i,"Goals"])
  FranceGoals[i,"TotalGoals"] <- sum(FranceGoals[1:i,"Goals"])
  if (i==(2020-Ystart+1)){
    BrazilGoals <- BrazilGoals[,-2]
    GermanyGoals <- GermanyGoals[,-2]
    ArgentinaGoals <- ArgentinaGoals[,-2]
    ItalyGoals <- ItalyGoals[,-2]
    FranceGoals <- FranceGoals[,-2]
  }
}
#Here is created the final dataset that contains for each year and for each team
#what was their total amount of goals at the time.
FinalDS = list(BrazilGoals, GermanyGoals, ArgentinaGoals, ItalyGoals, FranceGoals) %>% reduce(full_join, by = "Year")
colnames(FinalDS)[colnames(FinalDS) == 'TotalGoals.x'] <- 'Brazil'
colnames(FinalDS)[colnames(FinalDS) == 'TotalGoals.y'] <- 'Germany'
colnames(FinalDS)[colnames(FinalDS) == 'TotalGoals.x.x'] <- 'Argentina'
colnames(FinalDS)[colnames(FinalDS) == 'TotalGoals.y.y'] <- 'Italy'
colnames(FinalDS)[colnames(FinalDS) == 'TotalGoals'] <- 'France'

#Graphic analysis
ggplot()+
  geom_line(data=FinalDS,aes(y=Brazil,x= Year,color="Brazil"),size=2 )+
  geom_line(data=FinalDS,aes(y=Germany,x= Year,color="Germany"),size=2 )+
  geom_line(data=FinalDS,aes(y=Argentina,x= Year,color="Argentina"),size=2 )+
  geom_line(data=FinalDS,aes(y=Italy,x= Year,color="Italy"),size=2 )+
  geom_line(data=FinalDS,aes(y=France,x= Year,color="France"),size=2 ) +
  scale_color_manual(values = c(
    'Brazil' = 'green',
    'Germany' = 'orange',
    'Argentina' = 'yellow',
    'Italy' = 'red',
    'France' = 'blue')) +
  labs(color = 'Country')+
  ggtitle("Total amount of goals from the 5 most titled countries between 1900 and 2020") +
  theme(plot.title = element_text(hjust = 0.5))+ 
  scale_x_continuous(name="Time", limits = c(1900,2020)) +
  scale_y_continuous(name="Number of goals")