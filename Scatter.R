#3.
setwd("~/Loyola Courses/Data Visualization/homework/ggplot-HW-AkankshaNegi")
#4
midwest<-read.csv("Midwest.csv",header = TRUE)
options(scipen=999)
library(ggplot2)
theme_set(theme_bw())
#5
p<-ggplot(midwest,aes(x=area,y=poptotal))+
  geom_point(aes(col=state,size=popdensity))+
  geom_smooth(method = "loess", se=F)+
  xlim(c(0,0.1))+
  ylim(c(0,500000))+
  labs(subtitle="Area vs Population",
       y="Population",
       x="Area",
       title="Scatterplot",
       caption="Source:midwest"
       )
p  
#including omitted counties, removing limits from the plot

p<-ggplot(midwest,aes(x=area,y=poptotal,na.rm = FALSE))+
  geom_point(aes(col=state,size=popdensity))+
  geom_smooth(method = "loess", se=F)+
  labs(subtitle="Area vs Population",
       y="Population",
       x="Area",
       title="Scatterplot",
       caption="Source:midwest"
  )
p
#Now we see that there is one more unlabelled state present on screen.
#Which is not right.the red dot is hard to spot and since we have only 5 states this might be incorrect

#Only counties higher than 500,000 population

p<-ggplot(midwest,aes(x=area,y=poptotal))+
  geom_point(aes(col=state,size=popdensity))+
  geom_smooth(method = "loess", se=F)+
  xlim(c(0,0.1))+
  ylim(c(500000,NA))+
  labs(subtitle="Area vs Population",
       y="Population",
       x="Area",
       title="Scatterplot",
       caption="Source:midwest"
  )
p


