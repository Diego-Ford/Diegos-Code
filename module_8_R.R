library(plyr)
# read in data
data <- read.csv("Assignment 6 Dataset.txt", header = TRUE)

#calculate mean grade for students grouped by sex
data_plyr <- ddply(data, "Sex", transform, Grade.Average = mean(Grade))

#write this file out to working directory
write.csv(data_plyr,"Assignment6_means.csv")

#filter data by names that have the letter 'i or I' in them.
data_i <- subset(data_plyr, grepl("[iI]", data_plyr$Name))

#Write to a file
write.csv(data_i, "data_i.csv")