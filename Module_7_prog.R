data(swiss)
str(data)
list(swiss, 6)
head(swiss)

s3 <- list(who = "micahel", where = "NYC", work = "Plumber", age = 42)
s3

setClass("worker",
         slots = c(who = "character",
                   where = "character",
                   work = "character",
                   age = "numeric"))

# Create an object of class "worker"
s4 <- new("worker",
          who = "Michael",
          where = "NYC",
          work = "Plumber",
          age = 42)
s4
