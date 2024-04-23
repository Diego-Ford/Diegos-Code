library(tidyverse)
library(lubridate)
library(ggthemes)


suicide <- read.csv("data/Suicide.csv")

plot2 <- suicide %>%
  filter(STUB_LABEL == "All persons") %>%
  ggplot(aes(YEAR_NUM, ESTIMATE)) +
  geom_line() +
  labs(title = "Suicide Rates Per 100,000 people from 1950 to 2018",
       x = "Year Number",
       y = "Estimated Deaths") +
  theme_clean()
plot2

plot3 <- suicide %>%
  filter(STUB_LABEL %in% c("Male: White", "Female: White","Male: Hispanic or Latino: All races", 
                           "Female: Hispanic or Latino: All races")) %>%
  mutate(STUB_LABEL = case_when(STUB_LABEL == "Male: Hispanic or Latino: All races"~ "Male: Hispanic or Latino",
                                STUB_LABEL == "Female: Hispanic or Latino: All races"~ "Female: Hispanic or Latino",
                                TRUE ~ STUB_LABEL)) %>%
  ggplot(aes(YEAR_NUM, ESTIMATE, color = as.factor(STUB_LABEL))) +
  geom_line() +
  labs(title = "Suicide Rates Per 100,000 people from 1950 to 2018",
       x = "Year Number",
       y = "Estimated Deaths",
       color = "Category") +
  theme_clean()
plot3

plot4 <- suicide %>%
  filter(AGE_NUM %in% c(1,2,2.1,2.2,3,3.1,3.2,4,4.1,4.2,5,5.1,5.2,6)) %>%
  ggplot(aes(AGE, ESTIMATE)) +
  geom_boxplot() +
  labs(x = "Age Group",
       y = "Estimated Deaths",
       title = "Estimated Deaths Per 100,000 by Age Group",
       subtitle = "from 1950 - 2018") +
  theme_clean() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
plot4


  

