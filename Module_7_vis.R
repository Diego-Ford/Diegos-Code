data(mtcars)

ggplot(mtcars, aes(mpg)) +
  geom_histogram(bins = 5, aes(color = "red"), show.legend = FALSE) +
  labs(title = "distribution of miles per gallon in mtcars") +
  theme_few()


