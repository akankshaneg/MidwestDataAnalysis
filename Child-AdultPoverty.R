
#7
library(reshape2)
#Here I researched a bit to use a function for colorblind. And found this package viridis that I tried
#to use in the code to give the graph a colorblind
library(viridis)
midwestMelt <- melt(midwest[,c('PID','percchildbelowpovert', 'percadultpoverty','percelderlypoverty')],id="PID" )
head(midwestMelt)
p <- ggplot(midwestMelt, aes(x= variable, y=value,fill=variable))
p +ggtitle("Comparing Poverty Levels \n Child vs Adult vs Elderly")+
  theme(plot.title = element_text(color="black", hjust=0.5, face="bold.italic"))+
  stat_summary(fun.y = mean,geom = "bar")+
  scale_x_discrete(labels=c("percchildbelowpovert" = "Child", "percadultpoverty" = "Adult","percelderlypoverty"="Elderly"),name="Age group")+
  scale_y_continuous(name="Poverty Percent")+
  labs(fill = "Age group")+
   scale_fill_viridis(discrete=TRUE)
p
