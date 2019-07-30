## ----libraries-----------------------------------------------------------
library(DBI)
library(dbplyr)
library(dplyr)
library(dbplot)
library(ggplot2)
library(modeldb)
library(tidypredict)
library(config)

## ----connect-------------------------------------------------------------
con <- DBI::dbConnect(RSQLite::SQLite(), dbname = "mydatabase.db")

## ----connection summary--------------------------------------------------
summary(con)

## ----list tables---------------------------------------------------------
dbListTables(con)

## ----list table fields---------------------------------------------------
dbListFields(con, "ecom")

## ----query entire table--------------------------------------------------
dbReadTable(con, 'COMPANY')

## ----query few rows------------------------------------------------------
dbGetQuery(con, "select * from ecom limit 10")

## ----query data in batches-----------------------------------------------
query <- dbSendQuery(con, 'select * from ecom')
result <- dbFetch(query, n = 15)
result

## ----query status--------------------------------------------------------
DBI::dbHasCompleted(query)

## ----query info----------------------------------------------------------
DBI::dbGetInfo(query)

## ----get latest query----------------------------------------------------
DBI::dbGetStatement(query)

## ----rows fetched--------------------------------------------------------
DBI::dbGetRowCount(query)

## ----rows affected-------------------------------------------------------
DBI::dbGetRowsAffected(query)

## ----column info---------------------------------------------------------
DBI::dbColumnInfo(query)

## ----clear query result--------------------------------------------------
DBI::dbClearResult(query)

## ----check if table exists-----------------------------------------------
DBI::dbExistsTable(con, "trial")

## ----create table--------------------------------------------------------
# sample data
x     <- 1:10
y     <- letters[1:10]
trial <- tibble::tibble(x, y)

# write table to database
DBI::dbWriteTable(con, "trial", trial)

## ----list tables---------------------------------------------------------
DBI::dbListTables(con)

## ----create query--------------------------------------------------------
DBI::dbGetQuery(con, "select * from trial limit 5")

## ----overwrite table-----------------------------------------------------
# sample data
x      <- sample(100, 10)
y      <- letters[11:20]
trial2 <- tibble::tibble(x, y)

# overwrite table trial
DBI::dbWriteTable(con, "trial", trial2, overwrite = TRUE)

## ----append data---------------------------------------------------------
# sample data
x      <- sample(100, 10)
y      <- letters[5:14]
trial3 <- tibble::tibble(x, y)

# append data
DBI::dbWriteTable(con, "trial", trial3, append = TRUE)

## ----insert rows---------------------------------------------------------
DBI::dbExecute(con,
  "INSERT into trial (x, y) VALUES (32, 'c'), (45, 'k'), (61, 'h')"
)

## ----insert rows---------------------------------------------------------
DBI::dbSendStatement(con,
  "INSERT into trial (x, y) VALUES (25, 'm'), (54, 'l'), (16, 'y')"
)

## ----append table--------------------------------------------------------
trial_new <- data.frame(x = 30, y = 'k')
DBI::sqlAppendTable(con, "trial", trial_new)

## ----remove table--------------------------------------------------------
DBI::dbRemoveTable(con, "trial")

## ----data types----------------------------------------------------------
DBI::dbDataType(RSQLite::SQLite(), "a")
DBI::dbDataType(RSQLite::SQLite(), 1:5)
DBI::dbDataType(RSQLite::SQLite(), 1.5)

## ----generate sql query--------------------------------------------------
DBI::sqlCreateTable(con, "new", c(x = "integer", y = "text"))

## ----reference data------------------------------------------------------
ecom2 <- tbl(con, "ecom")
ecom2

## ----average time on site-------------------------------------------------
ecom2 %>% 
  select(referrer, device, duration) %>% 
  filter(device == "laptop") %>% 
  group_by(referrer) %>% 
  summarise(avg_tos = mean(duration)) %>% 
  arrange(avg_tos)

## ----show query----------------------------------------------------------
tos_query <- 
  ecom2 %>% 
  select(referrer, device, duration) %>% 
  filter(device == "laptop") %>% 
  group_by(referrer) %>% 
  summarise(avg_tos = mean(duration)) %>% 
  arrange(avg_tos)

show_query(tos_query)

## ----collect data--------------------------------------------------------
collect(tos_query)

## ----explain-------------------------------------------------------------
explain(tos_query)

## ----mysql simulate------------------------------------------------------
ecom2 %>% 
  group_by(referrer) %>% 
  summarise(avg_tos = mean(duration))  %>% 
  sql_render(simulate_mysql())

## ----bar plot------------------------------------------------------------
ecom2 %>% 
  dbplot_bar(device) + xlab("Device") + ylab("Count") + ggtitle("Device Distribution")

## ----line plot-----------------------------------------------------------
ecom2 %>% 
  dbplot_line(n_visit) + xlab("Visits") + ylab("Count") 

## ----simple regression---------------------------------------------------
ecom2 %>% 
  select(duration, n_visit) %>% 
  modeldb::linear_regression_db(duration)

## ----multiple regression-------------------------------------------------
ecom2 %>% 
  select(duration, n_visit, n_pages) %>%
  modeldb::linear_regression_db(duration, sample_size = 1000)

## ----categorical variables-----------------------------------------------
ecom2 %>% 
  select(duration, device) %>%
  add_dummy_variables(device, values = c("laptop", "mobile", "tablet")) %>%
  modeldb::linear_regression_db(duration)

## ----full example--------------------------------------------------------
ecom2 %>% 
  select(duration, n_visit, n_pages, device) %>%
  add_dummy_variables(device, values = c("laptop", "mobile", "tablet")) %>%
  modeldb::linear_regression_db(duration, sample_size = 1000)

## ----linear model--------------------------------------------------------
model <- lm(duration ~ device + referrer + n_visit + n_pages, data = ecom2)
model

## ----compute fitted values inside database-------------------------------
tidypredict_fit(model)

## ----sql translation of above step---------------------------------------
tidypredict_sql(model, con)

## ----add fitted values in a new column-----------------------------------
ecom2 %>% 
  tidypredict_to_column(model) %>% 
  select(duration, fit)

## ----sql translation of above step---------------------------------------
ecom2 %>% 
  tidypredict_to_column(model) %>% 
  select(duration, fit) %>% 
  remote_query()

## ----disconnect----------------------------------------------------------
DBI::dbDisconnect(con)

## ----use rstudioapi------------------------------------------------------
dbConnect(drv      = RMySQL::MySQL(), 
          username = rstudioapi::askForPassword("Database Username"),
          password = rstudioapi::askForPassword("Database Password"),
          host     ="mysql-ecom.cowqoftkc0gy.us-east-2.rds.amazonaws.com", 
          port     = 3306, 
          dbname   = "mysql_test")

## ----use .Renviron-------------------------------------------------------
dbConnect(drv      = RMySQL::MySQL(), 
          username = Sys.getenv("db_uid"), 
          password = Sys.getenv("db_pwd"), 
          host     ="mysql-ecom.cowqoftkc0gy.us-east-2.rds.amazonaws.com", 
          port     = 3306, 
          dbname   = "mysql_test")

## ----use options---------------------------------------------------------
source("options.R")
dbConnect(drv      = RMySQL::MySQL(), 
          username = getOption("database_userid"), 
          password = getOption("database_password"), 
          host     ="mysql-ecom.cowqoftkc0gy.us-east-2.rds.amazonaws.com", 
          port     = 3306, 
          dbname   = "mysql_test")

## ----use config----------------------------------------------------------
dw <- config::get("mysql-dev")

dbConnect(drv      = RMySQL::MySQL(), 
          username = dw$username,
          password = dw$password,
          host     = dw$host, 
          port     = dw$port, 
          dbname   = dw$dbname)