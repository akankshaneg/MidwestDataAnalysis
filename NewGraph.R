library(reshape2)
library(viridis)
library(tidyverse)
library(dbplyr)
#getting maps for lat long values
install.packages("maps")
options(scipen=999)
#extract data from built in maps for illinois
il_counties <- map_data("county", "illinois") %>%
  select(lon = long, lat, group, id = subregion)

#looking at the boundary for illinois counties.
ggplot(il_counties, aes(lon, lat)) +
  geom_polygon(aes(group = group), fill = NA, colour = "grey50") +
  coord_quickmap()

## Now lets extract illinoi data from midwest dataset
midwestdata<-filter(midwest,state=="IL")
#joining this with il counties
#but before that lets convert the county names to lower case in order to make join successfull
midwestdata$county <- tolower(midwestdata$county)
#lets join
ilcounties_data<-left_join(midwestdata,il_counties,by=c("county"="id"))
#Wow, I can see the population coverage for illinois by each county on the map.
ggplot(ilcounties_data, aes(lon, lat,group=county,color=poptotal)) +
  geom_polygon(fill=ilcounties_data$poptotal) +
  coord_quickmap()
#lets see area covered for percent of white
p<-ggplot(ilcounties_data, aes(lon, lat,group=county,color=ilcounties_data$percwhite)) +
  geom_polygon(fill=ilcounties_data$percwhite) +
  coord_quickmap()
p
#how about plotting the counties and see which areas are metro and which arent
p <- ggplot(ilcounties_data,
            aes(x = lon, y = lat,
                group = group, fill = inmetro))

p + geom_polygon(color = "gray90", size = 0.1) +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) 
  
p
