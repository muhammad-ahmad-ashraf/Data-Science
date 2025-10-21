#Question No 3
library(ggplot2)
head(mtcars)
#Scatter Plot
ggplot(mtcars, aes(x = hp, y = mpg)) + 
  geom_point()
# BoxPlot
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) + 
  geom_boxplot() +
  labs(x = "Number of Cylinders", y = "Miles per Gallon (mpg)", title = "Boxplot of MPG by Cylinder Count") +
  theme_bw()

# Histogram
ggplot(mtcars, aes(x = wt)) + 
  geom_histogram(bins = 10, fill = "lightblue", color = "black") +
  labs(x = "Weight (wt)", y = "Count", title = "Histogram of Car Weight") +
  theme_minimal()

#Question No 2
#2 part
salary <- c(50000, 60000, 70000, 80000, 50000, 65000, 45000, 60000)
mean(salary)
#3 part
employee_list <- list(emp_id = "E1", Name = "X", Age = 34, Department = "HR", Salary = 50000, Gender = "Male", Experience = 5 )
employee_list

#5
mean(salary)
sd(salary)


