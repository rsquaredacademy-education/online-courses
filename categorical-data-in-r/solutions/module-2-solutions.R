# load libraries
library(forcats)

# read data
analytics <- readRDS("analytics_raw.rds")

# check whether the below variables are factor
is.factor(analytics$device)
is.factor(analytics$page_depth)
is.factor(analytics$landing_page)

# coerce the following variables to type factor
analytics$device       <- as.factor(analytics$device)
analytics$os           <- as.factor(analytics$os)
analytics$browser      <- as.factor(analytics$browser)
analytics$user_type    <- as.factor(analytics$user_type)
analytics$channel      <- as.factor(analytics$channel)
analytics$gender       <- as.factor(analytics$gender)
analytics$landing_page <- as.factor(analytics$landing_page)
analytics$exit_page    <- as.factor(analytics$exit_page)
analytics$country      <- as.factor(analytics$country)
analytics$user_rating  <- as.factor(analytics$user_rating)

# use only male & female levels in the gender column
factor(analytics$gender, levels = c("male", "female"))

# include NA as a level in the gender column
factor(analytics$gender, levels = c("male", "female", NA))

# change label of NA to missing in the gender column
factor(analytics$gender,
       levels = c("male", "female", N),
       labels = c("male", "female", "missing"))

# change the labels of the levels in user_type column to new & returning
factor(analytics$user_type, 
       levels = c("New Visitor", "Returning Visitor"),
       labels = c("new", "returning"))

# user_rating
# membership testing
is.ordered(analytics$user_rating)

# using ordered
ordered(analytics$user_rating, levels = c("1", "2", "3", "4", "5"))

# using factor
factor(analytics$user_rating,
       levels  = c("1", "2", "3", "4", "5"),
       ordered = TRUE)