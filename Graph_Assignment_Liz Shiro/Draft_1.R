#Import my data
waste <- read.csv(file="Waste_StatsCan.csv")
View(waste)
names(waste)

library(dplyr)
newwaste <- select(waste, REF_DATE, GEO, Sources.of.waste.for.disposal, VALUE) %>%
  filter(GEO=="Canada") %>%
  filter(Sources.of.waste.for.disposal=="All sources of waste for disposal")
View(newwaste)

library(dplyr)
newwaste1 <- select(waste, REF_DATE, GEO, Sources.of.waste.for.disposal, VALUE) %>%
  filter(GEO=="Canada") %>%
  filter(Sources.of.waste.for.disposal=="Residential sources of waste for disposal")
View(newwaste1)

library(dplyr)
newwaste2 <- select(waste, REF_DATE, GEO, Sources.of.waste.for.disposal, VALUE) %>%
  filter(GEO=="Canada") %>%
  filter(Sources.of.waste.for.disposal=="Non-residential sources of waste for disposal")
View(newwaste2)

library(ggplot2)
g = ggplot()+
  geom_line(data=newwaste, aes(x=REF_DATE, y=VALUE), color="blue")+
  geom_line(data=newwaste1, aes(x=REF_DATE, y=VALUE), color="red")+
  geom_line(data=newwaste2, aes(x=REF_DATE, y=VALUE), color="green")+
  xlab('Date')+
  ylab('Tonnes')
print(g)

