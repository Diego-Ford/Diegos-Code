library(ggfortify)


data("AirPassengers")
head(AirPassengers)
AirPassengers

autoplot(AirPassengers, ts.color = "blue") +
  labs(title = "Number of Air Passengers from 1949 to 1961",
       x = "Dates",
       y = "Number of Passengers") +
  theme_classic()