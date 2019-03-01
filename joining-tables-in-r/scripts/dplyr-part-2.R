# install.packages('dplyr)
# install.packages('tidyverse')
library(dplyr)
library(readr)

# order
order <- read_delim('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/order.csv', delim = ';')

# customer
customer <- read_delim('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/customer.csv', delim = ';')

# inner join
inner_join(customer, order, by = "id")

# left join
left_join(customer, order, by = "id")

# right join
right_join(customer, order, by = "id")

# semi join
semi_join(customer, order, by = "id")

# anti join
anti_join(customer, order, by = "id")

# full join
full_join(customer, order, by = "id")
