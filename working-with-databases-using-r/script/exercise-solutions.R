# libraries
library(DBI)
library(dbplyr)
library(dplyr)
library(dbplot)
library(ggplot2)
library(modeldb)
library(tidypredict)
library(config)

# connect to mydatabase.db
con <- DBI::dbConnect(RSQLite::SQLite(), dbname = "mydatabase.db")

# list fields in the `trade` table
dbListFields(con, "trade")

# read all rows and columns from the `trade` table
dbReadTable(con, "trade")

# read first 30 rows from the `trade` table
dbGetQuery(con, "select * from trade limit 30")

# tables
# check if `mytable` exists in the database
dbExistsTable(con, "mytable")

# create new table `mytable` using the first 3 rows of `mtcars` data set
dbWriteTable(con, "mytable", mtcars[1:3,])

# list all tables to check if the new table has been created
dbListTables(con)

# overwrite `mytable` with the first 10 rows of `mtcars` data set
dbWriteTable(con, "mytable", mtcars[1:10,], overwrite = TRUE)

# append the 20th row of `mtcars` data set to `mytable`
dbWriteTable(con, "mytable", mtcars[20,], append = TRUE)

# create a new table using the last 5 rows of `mtcars` and append it to `mytable`
sqlAppendTable(con, "mytable", mtcars[28:32, ])

# remove `mytable` 
dbRemoveTable(con, "mytable")

# check data type of NULL
DBI::dbDataType(RSQLite::SQLite(), "NULL")

# data transformation
# use `tbl()` to reference `trade` table as `trade2`
trade2 <- tbl(con, "trade")

# compute average duration for `device`
tos_device <-
  trade2 %>% 
  group_by(device) %>% 
  summarize(avg_tos = mean(duration))

# display underlying SQL query
show_query(tos_device)

# retrieve data from tos_device
collect(tos_device)

# display underlying computation logic of tos_device
explain(tos_device)

# data visualization
# bar plot of `referrer` from the `trade` table
trade2 %>% 
  dbplot_bar(referrer) +
  xlab("Referrer") + 
  ylab("Count") +
  ggtitle("Referrer Distribution")

# line chart of `n_visit` from the `trade` table
trade2 %>% 
  dbplot_line(n_visit) +
  xlab("Visits") +
  ylab("Count")

# data modeling
# reference `ecom` table
ecom2 <- tbl(con, "ecom")

# regress `duration` on `n_pages`
ecom2 %>% 
  select(duration, n_pages) %>% 
  linear_regression_db(duration)
  
# regress `duration` on `referrer`
ecom2 %>% 
  select(duration, referrer) %>%
  add_dummy_variables(referrer, values = c("bing", "direct", "google", "social", "yahoo")) %>% 
  modeldb::linear_regression_db(duration)

# regress `duration` on `n_pages`, `n_visit` and `referrer`
ecom2 %>% 
  select(duration, n_pages, n_visit, referrer) %>%
  add_dummy_variables(referrer, values = c("bing", "direct", "google", "social", "yahoo")) %>% 
  modeldb::linear_regression_db(duration, sample_size = 1000)
