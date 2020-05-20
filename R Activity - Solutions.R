install.packages("dplyr","corrplot","ggplot2")

library (dplyr)
library (ggplot2)

######################################################################

# Activity questions 

# Q1 - Filter
# Filter cars where the horsepower is greater than 150
# and the weight is greater than 3.2
filter(mtcars, hp > 150 & wt>3.2)

# Q2 - Arrange
# Arrange the dataset in order of mpg and wt
arrange(mtcars, mpg, wt)

#####################
# Analyse

# Q3 - What is the mean car weight (wt)?
mean(mtcars$wt)

# Q4 - What is the median car weight? - how does this relate to the mean?
median(mtcars$wt)

# Q5 - What is the standard deviation of the car weight?
sd(mtcars$wt)

# Q6 - Set up a table of the car weights
# What does the table tell us?
mtcarswt = table(mtcars$wt)
mtcarswt
# Car weights are unique in all but two cases

# Q7 - Using the correlation matrix in the script - which 2 variables have 
# the strongest positive correlations with wt (roughly >0.7 and <1)?

# disp and cyl .. the more cylinders the car has, the greater the weight

####################
# Visualise

# Q8 -Set up a basic histogram of the car weights (wt)
hist(mtcars$wt)

# Q9 - We know that there is a strong relationship between mpg and wt.
# Does this also apply to mp and gross horsepower (hp)
# Set up a regression plot to check (roughly) on whether the two are strongly related

x <- mtcars$wt
y <- mtcars$mpg
# Plot with main and axis titles
# Change point shape (pch = 19) and remove frame.
plot(x, y, main = "Main title",
     xlab = "wt", ylab = "mpg",
     pch = 19, frame = FALSE)
# Add regression line
plot(x, y, main = "Main title",
     xlab = "wt", ylab = "mpg",
     pch = 19, frame = FALSE)
abline(lm(y ~ x, data = mtcars), col = "blue")
