library(sqldf)

#read in csv with combined data from oct.28th - nov.12th
combinedTweets <- read.csv("G:\\My Drive\\Ontonotes NER Output\\Input Data\\combined_no_duplicates_80.csv")

#extract the authors column
tweetAuthors <- data.frame(combinedTweets$Author)
colnames(tweetAuthors)[18] <- "Authors"


#perform SQL query to count tweet authors
AuthorCounts <- sqldf("SELECT Author, COUNT(Author) FROM combinedTweets 
                      GROUP BY Author ORDER BY COUNT(Author) DESC")

write.csv(AuthorCounts, "G:\\My Drive\\Ontonotes NER Output\\noDuplicate_AuthorCounts.csv")

KanekoaTweets <- sqldf("SELECT * FROM Combined WHERE Author = 'KanekoaTheGreat'")
AnonymousTweets <- sqldf("SELECT * FROM Combined WHERE Author = 'Anonymous'")
UnrollHelperTweets <- sqldf("SELECT * FROM Combined WHERE Author = 'UnrollHelper'")
sailfishgolferTweets <- sqldf("SELECT * FROM Combined WHERE Author = 'sailfishgolfer'")

Nov7thTweets <- sqldf("SELECT Author,TITLE,URL,Date FROM Combined WHERE Date LIKE  '2020-11-07%'")

write.csv(KanekoaTweets,"C:\\Users\\diego\\OneDrive\\Desktop\\BotTest\\NER_TEST_FILES\\KanekoaTweets.csv" )
write.csv(AnonymousTweets,"C:\\Users\\diego\\OneDrive\\Desktop\\BotTest\\NER_TEST_FILES\\AnonymousTweets.csv" )
write.csv(UnrollHelperTweets,"C:\\Users\\diego\\OneDrive\\Desktop\\BotTest\\NER_TEST_FILES\\UnrollHelperTweets.csv" )
write.csv(sailfishgolferTweets,"C:\\Users\\diego\\OneDrive\\Desktop\\BotTest\\NER_TEST_FILES\\sailfishgolferTweets.csv" )