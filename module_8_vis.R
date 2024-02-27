data("USArrests")
library(ggplot2)

ggplot(USArrests, aes(Murder, Assault)) +
  geom_point(size = 3, color = "blue", alpha = 0.5) +
  geom_smooth(method = lm, color = "red") +
  labs( title = "Assault Arrests as A Factor of Murder Arrests",
        subtitle = "From USArrests Dataset") +
  theme_classic()