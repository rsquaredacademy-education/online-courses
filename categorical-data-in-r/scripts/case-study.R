## ----load packages-------------------------------------
library(readr)

## ----read csv file-------------------------------------
read_csv("analytics_raw.csv", 
         col_types = cols_only(device = col_factor(levels = c("Desktop", "Tablet", "Mobile")), 
                               gender = col_factor(levels = c("female", "male", "NA")), 
                               user_rating = col_factor(levels = c("1", "2", "3", "4", "5"),
                                                        ordered = TRUE)))


## ----read RDS file-------------------------------------
data <- readRDS('analytics.rds')
head(data)