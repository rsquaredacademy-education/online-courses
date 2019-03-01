# install.packages("dplyr")
# install.packages("tidyverse")
library(dplyr)
library(readr)

# import data 
ecom <- 
  read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/web.csv',
           col_types = cols_only(device = col_factor(levels = c("laptop", "tablet", "mobile")),
              referrer = col_factor(levels = c("bing", "direct", "social", "yahoo", "google")),
              purchase = col_logical(), n_pages = col_double(), n_visit = col_double(), 
              duration = col_double(), order_value = col_double(), order_items = col_double()
           )
  )

# filter data
filter(ecom, device == "mobile")
filter(ecom, device == "mobile", purchase)
filter(ecom, device == "mobile", !purchase)
filter(ecom, device == "mobile", n_pages > 5)

# case study
filter(ecom, purchase)

# select
select(ecom, device, duration)
select(ecom, referrer:purchase)
select(ecom, -n_visit, -order_items)

# case study
ecom1 <- filter(ecom, purchase)
ecom2 <- select(ecom1, device, order_value)

# group by
group_by(ecom, device)
ecom3 <- group_by(ecom2, device)

# summarize
summarise(ecom3, revenue = sum(order_value), orders = n())
summarise_all(ecom3, funs(revenue = sum, orders = n()))
ecom4 <- summarise(ecom3, revenue = sum(order_value), orders = n())

# mutate
ecom5 <- mutate(ecom4, aov = revenue / orders)

# arrange
arrange(ecom5, aov)
arrange(ecom5, desc(aov))
ecom6 <- select(ecom5, device, aov)

# solution
ecom1 <- filter(ecom, purchase)
ecom2 <- select(ecom1, device, order_value)
ecom3 <- group_by(ecom2, device)
ecom4 <- summarise(ecom3, revenue = sum(order_value), orders = n())
ecom5 <- mutate(ecom4, aov = revenue / orders)
ecom6 <- select(ecom5, device, aov)
arrange(ecom6, aov)



