library(ggplot2)
library(gganimate)
library(tidyverse)
library(HistData)
library(reshape2)

data(WorldPhones)
phones <- as.data.frame(WorldPhones)
phones$year <- c(1951,1952,1953,1954,1955,1956,1957)

Nightingale %>%
  ggplot(aes(Date, Disease)) +
  geom_line(color = "red", size = 1.5) +
  geom_point(size = 3) +
  ggtitle("Disease Rate of The British Army in Crimea, 'Year: {frame_vars}'") +
  theme_classic() +
  ylab("Disease Rate") +
  xlab("Date")+
  transition_reveal(Date)
  
anim_save("module-13.gif")





frame_