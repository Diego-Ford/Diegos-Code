data("USArrests")

ggplot(USArrests, aes(Assault, Murder, color = UrbanPop)) +
  geom_point() +
  labs(title = "Arrests for Murder by Assault and Urban Population") +
  theme_classic()