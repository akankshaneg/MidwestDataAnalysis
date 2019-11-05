#6
#a. It would be better to use inmetro as a factor rather than an integer
midwest$inmetro

midwestdata<-midwest[!is.na(midwest$inmetro),]

p <- ggplot(midwestdata, aes(x= factor(inmetro), y=percbelowpoverty,fill=factor(inmetro)))
p +ggtitle("Percent of Population under the Poverty Level \n by Metro Area")+
  theme(plot.title = element_text(color="black", hjust=0.5, face="bold.italic"))+
  stat_summary(fun.y = mean,geom = "bar")+
  scale_x_discrete(labels=c("0" = "In Metro Area", "1" = "Not in Metro Area"))+
  scale_y_continuous(name="Population Percentage")
p
