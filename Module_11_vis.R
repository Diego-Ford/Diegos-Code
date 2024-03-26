install.packages(c("CarletonStats", "devtools", "epanetReader", "fmsb", "ggplot2", "ggthemes", 
                   "latticeExtra", "MASS", "PerformanceAnalytics", "psych", 
                   "plyr", "prettyR", "plotrix", "proto", "RCurl", "reshape", "reshape2"))

library(devtools)
source_url("https://raw.githubusercontent.com/sjmurdoch/fancyaxis/master/fancyaxis.R")
data("trees")

x <- trees$Girth
y <- trees$Height


library(ggplot2)
library(ggExtra)
library(ggthemes)

 p <- ggplot(trees, aes(Height, Girth)) + geom_point() + theme_tufte(ticks=F)
ggMarginal(p, type = "histogram", fill="transparent")