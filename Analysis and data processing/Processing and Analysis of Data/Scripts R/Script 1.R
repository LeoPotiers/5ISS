
library(dplyr)
library(ggplot2)

#Number of international soccer matches per decade :
Nb1870s<-filter(foot_results, year>=1872 & year<1880)
Nb1870s[,"year"]="1870s"
Nb1870s<-count(Nb1870s, Nb1870s[,"year"])

Nb1880s<-filter(foot_results, year>=1880 & year<1890)
Nb1880s[,"year"]="1880s"
Nb1880s<-count(Nb1880s, Nb1880s[,"year"])

Nb1890s<-filter(foot_results, year>=1890 & year<1900)
Nb1890s[,"year"]="1890s"
Nb1890s<-count(Nb1890s, Nb1890s[,"year"])

Nb1900s<-filter(foot_results, year>=1900 & year<1910)
Nb1900s[,"year"]="1900s"
Nb1900s<-count(Nb1900s, Nb1900s[,"year"])

Nb1910s<-filter(foot_results, year>=1910 & year<1920)
Nb1910s[,"year"]="1910s"
Nb1910s<-count(Nb1910s, Nb1910s[,"year"])

Nb1920s<-filter(foot_results, year>=1920 & year<1930)
Nb1920s[,"year"]="1920s"
Nb1920s<-count(Nb1920s, Nb1920s[,"year"])

Nb1930s<-filter(foot_results, year>=1930 & year<1940)
Nb1930s[,"year"]="1930s"
Nb1930s<-count(Nb1930s, Nb1930s[,"year"])

Nb1940s<-filter(foot_results, year>=1940 & year<1950)
Nb1940s[,"year"]="1940s"
Nb1940s<-count(Nb1940s, Nb1940s[,"year"])

Nb1950s<-filter(foot_results, year>=1950 & year<1960)
Nb1950s[,"year"]="1950s"
Nb1950s<-count(Nb1950s, Nb1950s[,"year"])

Nb1960s<-filter(foot_results, year>=1960 & year<1970)
Nb1960s[,"year"]="1960s"
Nb1960s<-count(Nb1960s, Nb1960s[,"year"])

Nb1970s<-filter(foot_results, year>=1970 & year<1980)
Nb1970s[,"year"]="1970s"
Nb1970s<-count(Nb1970s, Nb1970s[,"year"])

Nb1980s<-filter(foot_results, year>=1980 & year<1990)
Nb1980s[,"year"]="1980s"
Nb1980s<-count(Nb1980s, Nb1980s[,"year"])

Nb1990s<-filter(foot_results, year>=1990 & year<2000)
Nb1990s[,"year"]="1990s"
Nb1990s<-count(Nb1990s, Nb1990s[,"year"])

Nb2000s<-filter(foot_results, year>=2000 & year<2010)
Nb2000s[,"year"]="2000s"
Nb2000s<-count(Nb2000s, Nb2000s[,"year"])

Nb2010s<-filter(foot_results, year>=2010 & year<2020)
Nb2010s[,"year"]="2010s"
Nb2010s<-count(Nb2010s, Nb2010s[,"year"])

Nb2020s<-filter(foot_results, year>=2020 & year<2030)
Nb2020s[,"year"]="2020s"
Nb2020s<-count(Nb2020s, Nb2020s[,"year"])

Nb<-rbind(Nb1870s,Nb1880s,Nb1890s,Nb1900s,Nb1910s,Nb1920s,Nb1930s,Nb1940s,Nb1950s,Nb1960s,Nb1970s, Nb1980s, Nb1990s, Nb2000s,Nb2010s, Nb2020s)

#Displaying the graph :

p<-ggplot(Nb,aes(x=year, y=n, group=1))

#We choose to display a curve
p<-p+geom_line()

#We rename the x-axis
p<-p+xlab("Decade")

#We rename the y-axis
p<-p+ylab("Number of matches")

#We choose the title of the graph
p<-p+ggtitle("Evolution of the number of international soccer games since 1870s")

#We center the title of the graph
p<-p+ theme(plot.title = element_text(hjust = 0.5))

#print(ggplot(Nb,aes(x=year, y=n, group=1))+geom_line() + theme(axis.text.x = element_text(angle = 90)) + xlab("Year") + ylab("Number of matches") + ggtitle("Evolution du nombre de match internationaux de Football depuis 1872") + theme(plot.title = element_text(hjust = 0.5)))

#Finally, we print the plot
print (p)