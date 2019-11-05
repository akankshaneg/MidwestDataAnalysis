data("midwest")
library(tidyr)
midwest<-midwest %>% drop_na()
midwest$CountyStates <- paste(midwest$county,midwest$state)

midwest$percchildbelowpovert_mean <- mean(midwest$percchildbelowpovert)

midwest$percchildbelowpovert_type<-ifelse(midwest$percchildbelowpovert <midwest$percchildbelowpovert_mean, "Below Average", "Above Average")

head(midwest)
midwest <- midwest[order(midwest$percchildbelowpovert), ]
midwest$CountyStates<-factor(midwest$CountyStates,levels=midwest$CountyStates)

ggplot(midwest, aes(x=CountyStates, y=percchildbelowpovert)) +
  geom_bar(stat='identity', aes(fill=percchildbelowpovert_type))  +
   scale_fill_manual(name="Child Poverty",
                     labels = c("Below Average","Above Average"),
                     values = c("below"="#00ba38", "above"="#f8766d")) +
  labs(subtitle="Percent Child Poverty of each county",
       title= "Diverging Bars") +
  coord_flip()


midwest$percchildbelowpovert_z <-  round((midwest$percchildbelowpovert - mean(midwest$percchildbelowpovert))/sd(midwest$percchildbelowpovert), 2)
midwest$percchildbelowpovert_type_new <- ifelse(midwest$percchildbelowpovert_z < 0, "below", "above")
midwest <- midwest[order(midwest$percchildbelowpovert_z), ]

p<-ggplot(midwest, aes(x=CountyStates, y=percchildbelowpovert_z)) + 
  geom_bar(stat='identity', aes(fill=percchildbelowpovert_type_new), width=.5)  +
  scale_fill_manual(name="Child Poverty", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#00ba38", "below"="#f8766d")) + 
  labs(subtitle="Percent Child Poverty of each county'", 
       title= "Diverging Bars") + 
  coord_flip()

ggsave('p.png', p, height = 50, width = 20, limitsize = F)

midwest <- midwest[order(midwest$percchildbelowpovert_z), ]

midwest.ordered<-midwest[order(midwest$poptotal), ]
top30<-tail(midwest.ordered,30)

p<-ggplot(top30, aes(x=CountyStates, y=percchildbelowpovert_z)) + 
  geom_bar(stat='identity', aes(fill=percchildbelowpovert_type_new), width=.5)  +
  scale_fill_manual(name="Child Poverty", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#00ba38", "below"="#f8766d")) + 
  labs(subtitle="Percent Child Poverty of each county'", 
       title= "Diverging Bars") + 
  coord_flip()
p


