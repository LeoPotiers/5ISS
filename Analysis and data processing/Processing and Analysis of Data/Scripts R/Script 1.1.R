
library(dplyr)
library(ggplot2)

#Number of international soccer games per year :
Nb<-count(foot_results, foot_results[,"year"])

#Displaying the graph :

p<-ggplot(Nb,aes(x=year, y=n, group=1))

#We choose to display a curve
p<-p+geom_line()

#We display values on X-axis vertically 
p<-p+ theme(axis.text.x = element_text(angle = 90))

#We rename the x-axis
p<-p+xlab("Year")

#We rename the y-axis
p<-p+ylab("Number of games")

#We choose the title of the graph
p<-p+ggtitle("Evolution of the number of international soccer games since 1872")

#We center the title of the graph
p<-p+ theme(plot.title = element_text(hjust = 0.5))

#print(ggplot(Nb,aes(x=year, y=n, group=1))+geom_line() + theme(axis.text.x = element_text(angle = 90)) + xlab("Year") + ylab("Number of matches") + ggtitle("Evolution du nombre de match internationaux de Football depuis 1872") + theme(plot.title = element_text(hjust = 0.5)))

#Finally, we print the plot
print (p)