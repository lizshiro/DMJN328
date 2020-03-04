#Import my data
waste <- read.csv(file="Waste_StatsCan.csv")
View(waste)
names(waste)

library(dplyr)
newwaste <- select(waste, REF_DATE, GEO, Sources.of.waste.for.disposal, VALUE) %>%
  filter(GEO=="British Columbia" | GEO=="Ontario" | GEO=="Quebec") %>%
  filter(Sources.of.waste.for.disposal=="All sources of waste for disposal")
View(newwaste)

options(scipen = 999)

library(ggplot2)
ggplot(newwaste, aes(fill=GEO, y=VALUE, x=REF_DATE))+
  geom_bar(position="dodge", stat="identity")+
  xlab('Date')+
  ylab('Tonnes')+
  labs(title = "Waste Collected across Canada, Ontario and Quebec",
       subtitle = "(2002-2016)",
       caption = "Data from StatCan",
       colour = "Location")



