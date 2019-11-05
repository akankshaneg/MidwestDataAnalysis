#adding column to include latitude based on the state
midwestdata$lat<-ifelse(midwest$state=="IL", "40.265028",
                        ifelse(midwest$state=="MI", "43.924812",
                               ifelse(midwest$state=="WI", "44.356004",
                                      ifelse(midwest$state=="OH", "40.262259",
                                             ifelse(midwest$state=="IN", "39.904493",NA)))))
midwestdata$lon<-ifelse(midwest$state=="IL", "-89,191575",
                        ifelse(midwest$state=="MI", "-84,633107",
                               ifelse(midwest$state=="WI", "-89,466198",
                                      ifelse(midwest$state=="OH", "-82,883453",
                                             ifelse(midwest$state=="IN", "-86,250281",NA)))))

midwest<-read.csv("Midwest.csv",header = TRUE)
midwestdata$region<-ifelse(midwest$state=="IL", "illinois",
                           ifelse(midwest$state=="MI", "michigan",
                                  ifelse(midwest$state=="WI", "wisconsin",
                                         ifelse(midwest$state=="OH", "ohio",
                                                ifelse(midwest$state=="IN", "indiana",NA)))))
midwest_pop <- left_join(midwestdata,us_states)
midwestdata<-midwest
midwestdata$region<-ifelse(midwest$state=="IL", "illinois",
                           ifelse(midwest$state=="MI", "michigan",
                                  ifelse(midwest$state=="WI", "wisconsin",
                                         ifelse(midwest$state=="OH", "ohio",
                                                ifelse(midwest$state=="IN", "indiana",NA)))))
midwest_pop <- left_join(midwestdata,us_states)
library(maps)
us_states <- map_data("state")
midwest_pop <- left_join(midwestdata,us_states)
View(midwest_pop)
View(midwest_pop)
p <- ggplot(data = midwest_pop,
            mapping = aes(x = long, y = lat,
                          group = group,fill=poptotal))
p
p <- ggplot(data = midwest_pop,
            mapping = aes(x = long, y = lat,
                          group = group,fill=county))
p
View(midwest_pop)
midwest_popfinal<- subset(midwest_pop, select = -c(orders) )
midwest_popfinal<- subset(midwest_pop, select = -c(order) )
View(midwest_popfinal)
by_region<-midwest_popfinal %>% group_by(county)
View(by_region)
by_counties<-distinct(midwest_popfinal,county,state)
View(by_counties)
by_county<-distinct(midwest_popfinal,county,state,region,poptotal)
View(by_county)
by_county<-distinct(midwest_popfinal,county,state,region,poptotal,lat,long,group)
View(by_county)