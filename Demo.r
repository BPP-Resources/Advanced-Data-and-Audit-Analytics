# Install the packages necessary - the data is contained in the 'nyflights13' package. 
# The packages 'dplyr', 'tidyr' and 'magrittr' are used for data processing
# ggplot is used for graphics

install.packages("dplyr", "nycflights13", "ggplot2", "tidyr", "magrittr")

# Having installed the packages, we now tell r that we are going to use them.

library(dplyr)
library(nycflights13)
library(ggplot2)
library(tidyr)
library(magrittr)

# First look at the dataset using glimpse
glimpse (flights)

# Use filter to get all of the flights on 01 January from airline B6
filter(flights, month == 1, day == 1, carrier == 'B6')

# Isolate rows 5-10 of the dataset, using slice
slice(flights, 5:10)

# Arrange the dataset in descending order of scheduled departure time
arrange(flights, desc(sched_dep_time))

# Organise the dataset in order of flight distance, minute and arrival delay
flights %>% select(distance, minute, arr_delay)

# Use 'distinct' to isolate the carriers
flights %>% distinct(carrier)

# sample_n to pull out 10 random rows from the dataset
flights %>% sample_n(10) # 10 random rows

# sample_frac to get a proportion of the rows (1%)
flights %>% sample_frac(0.01)

# Use 'summarise' to get the mean arrival delay of the flights and the mean distance flown
# summarise takes a set of values and puts it down to a single value
flights %>% summarise(count=n(),
                      mean_arr_delay = arr_delay %>% mean(na.rm = TRUE),
                      mean_distance = distance %>% mean(na.rm=TRUE))

# Here's a really cool example from the vignette
# 1) Group the data into individual planes (via tailnum) and count the number of flights
# 2) Compute the mean distance of the flights
# 3) Compute the mean arrival delay
# then plot

# send the results to a new file called out_tbl
out_tbl = flights %>%
  group_by(tailnum) %>% # Group by tail number
  summarise(count = n(), # n() here used to get number of rows in each group
            dist = mean(distance, na.rm = TRUE), # mean distance
            delay = mean(arr_delay, na.rm = TRUE)) %>% # mean arrival delay
  filter(count > 20, dist < 2000)

# Now plot
library(ggplot2)
ggplot(out_tbl, aes(dist, delay)) +
  geom_point(aes(size = count), alpha = 1/2) +
  geom_smooth() +
  scale_size_area()
