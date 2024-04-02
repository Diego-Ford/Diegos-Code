
devtools::install_github("briatte/ggnet")
library(ggnet)
library(RColorBrewer)
library(tidyverse)


edgeList <- read.csv("C:/Users/diego/OneDrive/Desktop/Network Analysis/nov1_7_edgelist.csv")
edgeList <- edgeList[,c("Target","Source", "Weight")]
net = network(edgeList, directed = TRUE, loops = TRUE)

x = data.frame(Target = network.vertex.names(net))
x = merge(x, edgeList, by = "Target", sort = FALSE)$Weight

net %v% "weight" = as.character(x)

y = brewer.pal(3, "Set1")
names(y) = c(1,2,3)


ggnet2(net, color = "weight", palette = y, size = "weight", size.palette = c("1" = 2, "2" = 10), alpha = 0.75, edge.alpha = 0.9)




