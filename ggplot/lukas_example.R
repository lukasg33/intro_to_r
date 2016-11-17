install.packages("ggplot2")
library(ggplot2)
library(dplyr)
install.packages("data.table")
library(data.table)
load("suicides.rdata")

all.suicides <- copy(suicides)

suicides <- suicides %>% 
  group_by(year,state,means) %>% 
  mutate(deaths = sum(deaths))

bare <- ggplot(suicides)

#adding plot aethetics
aesthetic <- ggplot(suicides, aes(x=year, y=deaths))

scatter <-  ggplot(suicides, aes(x=year, y=deaths)) + 
  geom_point()

## split means by color 

color_by_means <- ggplot(suicides, aes(x=year, y=deaths, color=means)) + 
  geom_point() 

##facet by state
state_fact <- ggplot(suicides, aes(x=year, y=deaths, color=means)) + 
  geom_point() +
  facet_wrap(~state, scales = "free")

##line plot
state_line <- ggplot(suicides, aes(x=year, y=deaths, color=means)) + 
  geom_line(size = 3) +
  facet_wrap(~state, scales = "free")


