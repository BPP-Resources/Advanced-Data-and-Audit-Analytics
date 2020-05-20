install.packages("dplyr","corrplot","ggplot2")

library (dplyr)
library (corrplot)
library (ggplot2)

# Basic views of the mtcars dataset - how many rows? / how many variables?
summary(mtcars)
glimpse(mtcars)

# Filter Data

# 1 - Filter
# Cars where the hp is greater than 150
filter(mtcars, hp > 150)

# Cars where the hp is greater than 150 and the wt is greater than 5
filter(mtcars, hp > 150 & wt > 5)

# 2 - arrange
# Arrange the data in order of cyl then disp
arrange(mtcars, cyl, disp)

# 3 - select
# Add two new columns - one with the cyl value doubled, and one with the cyl
# value quadrupled - then show everything

mtcars %>% mutate(
  cyl2 = cyl * 2,
  cyl4 = cyl2 * 2
)

##############################################################

# Analyse Data

# 4 - mean
# Get the mean mpg
mean(mtcars$mpg)

# 5 - median
# Get the median mpg - what do you notice when you compare it to the mean?
median(mtcars$mpg)

# 6 - standard deviation - get the standard deviation of mpg
sd(mtcars$mpg)

# 7 - table
# Set up a basic table of carb values
mtcarscarb = table(mtcars$carb)

# then show it
mtcarscarb

# 8 - correlation matrix between each of the values
cor(mtcars)


##################################################################

# Visualise

# 9 - plot
# basic histogram of mpg
hist(mtcars$mpg)

# qplot - same idea but uses ggplot2 - easier to read
qplot(mtcars$mpg, binwidth = 3, color = I("white"))

# 10 - plot
# regression plot showing relationship between wt and mpg
# by changing the first two lines we can plot other variables instead

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

######################################################################

# Activity questions 

# Q1 - Filter
# Filter cars where the horsepower is greater than 150
# and the weight is greater than 3.2

# Q2 - Arrange
# Arrange the dataset in order of mpg and wt

#####################
# Analyse

# Q3 - What is the mean car weight (wt)?

# Q4 - What is the median car weight? - how does this relate to the mean?

# Q5 - What is the standard deviation of the car weight?

# Q6 - Set up a table of the car weights
# What does the table tell us?

# Q7 - Using the correlation matrix in the script - which 3 pairs have
# the strongest positive correlations between them (roughly >0.7 and <1)?

####################
# Visualise

# Q8 -Set up a basic histogram of the car weights (wt)

# Q9 - We know that there is a strong relationship between mpg and wt.
# Does this also apply to mp and gross horsepower (hp)
# Set up a regression plot to check (roughly) on whether the two are strongly related
