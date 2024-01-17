library(sqldf)
library(readxl)
library(dplyr)

#load in data
NER_dates <- read.csv("C:\\Users\\diego\\OneDrive\\Desktop\\BotTest\\NER_TEST_FILES\\Ner Output\\Jh_oct28_nov12.csv")
Combined <- read.csv("C:\\Users\\diego\\OneDrive\\Desktop\\BotTest\\NER_TEST_FILES\\input data\\oct28_nov12_combined_data.csv")

#change query id 
Combined$Query.Id <- 0:(nrow(Combined) - 1)

# Use match to find matching indices
matching_indices <- match(NER_dates$tweet_id, Combined$Query.Id)

# Create a new date column based on the matches
NER_dates$date <- Combined$Date[matching_indices]

#save as csv
write.csv(NER_dates, file = "C:\\Users\\diego\\OneDrive\\Desktop\\BotTest\\NER_TEST_FILES\\Ner Output\\combined_dates.csv", row.names = FALSE)
# read in Ner output data with dates
Ner_Output <- read.csv('C:\\Users\\diego\\OneDrive\\Desktop\\BotTest\\NER_TEST_FILES\\Ner Output\\combined_dates.csv')


#Get counts of unique locations  
locationCounts <- sqldf("SELECT entity,date, COUNT(entity) FROM Ner_Output WHERE tag ='LOC' 
                        GROUP BY entity,date ORDER BY COUNT(entity) DESC")
#write.csv of counted locations
write.csv(locationCounts, 'C:\\Users\\diego\\OneDrive\\Desktop\\BotTest\\NER_TEST_FILES\\Ner Output\\location_counts_dates_noProcess.csv')


