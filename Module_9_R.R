data(iris)


#Base R Vis

plot(iris$Sepal.Width, iris$Sepal.Length, 
     xlab = "Sepal Width", ylab = "Sepal Length", 
     main = "Scatter Plot of Sepal Length vs. Sepal Width")


#Lattice Vis
library(lattice)

histogram(~ Sepal.Length, data = iris, 
          main = "Histogram of Sepal Length",
          xlab = "Sepal Length", ylab = "Frequency",
          col = "skyblue",  # Change the color of bars
          breaks = 20,  # Change the number of bins
          type = "count")  # Show counts on y-axis instead of densities

#ggplot Vis
library(ggplot2)

ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(x = "Species", y = "Sepal Length", title = "Box Plot of Sepal Length by Species") +
  theme_classic()
