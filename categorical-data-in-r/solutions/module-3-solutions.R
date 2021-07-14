# load libraries
library(dplyr)
library(forcats)
library(gmodels)
library(descriptr)

# read data
analytics <- readRDS("analytics.rds")

# display the number of levels 
nlevels(analytics$browser)
nlevels(analytics$channel)
nlevels(analytics$landing_page)
nlevels(analytics$exit_page)

# display the categories
levels(analytics$os)
levels(analytics$channel)
unique(analytics$browser)
unique(analytics$gender)
fct_unique(analytics$user_type)

# display the count/frequency 
table(analytics$channel)
summary(analytics$user_type)

# using forcats
fct_count(analytics$channel)
fct_count(analytics$user_type)

# using group_by, count and tally from dplyr package
# count
count(analytics, channel)
count(analytics, user_type)

# tally
analytics %>% 
  group_by(channel) %>% 
  tally()

analytics %>% 
  group_by(user_type) %>% 
  tally()

# display two way tables
table(analytics$channel, analytics$user_type)

# dplyr count
count(analytics, device, purchase_flag)

# dplyr tally
analytics %>% 
  group_by(channel, device) %>% 
  tally()

# gmodels package
CrossTable(analytics$channel, analytics$device)

# descriptr package
ds_cross_table(analytics, channel, device)

# xtabs
mytable <- xtabs(~user_type+purchase_flag, data = analytics)
ftable(mytable)





