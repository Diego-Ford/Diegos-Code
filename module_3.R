Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")

ABC_political_poll_results <- c(4, 62, 51, 21, 2, 14, 15)

CBS_political_poll_results <- c(12, 75, 43, 19, 1, 21, 19) 

Election_df <- data.frame(Name, ABC_political_poll_results, CBS_political_poll_results)

newCnames <- c("Candidate", "ABC Results", "CBS Results")

Election_df <- `colnames<-`(Election_df, newCnames)

