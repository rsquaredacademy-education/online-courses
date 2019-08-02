## ----libraries-----------------------------------------------------------
# install.packages(c("DBI", "dbplyr", "dplyr", "dbplot", "ggplot2", "modeldb",
# "tidypredict", "config"))
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
dbReadTable(con, "ecom")

## ----query few rows------------------------------------------------------
dbGetQuery(con, "select * from ecom limit 10")

## ----query data in batches-----------------------------------------------
query  <- dbSendQuery(con, 'select * from ecom')
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

## ----remove table--------------------------------------------------------
DBI::dbRemoveTable(con, "trial")

## ----data types----------------------------------------------------------
DBI::dbDataType(RSQLite::SQLite(), "a")
DBI::dbDataType(RSQLite::SQLite(), 1:5)
DBI::dbDataType(RSQLite::SQLite(), 1.5)

## ----generate sql query--------------------------------------------------
## ----create table--------------------------------------------------------
DBI::sqlCreateTable(con, "new", c(x = "integer", y = "text"))

## ----append table--------------------------------------------------------
trial_new <- data.frame(x = 30, y = 'k')
DBI::sqlAppendTable(con, "trial", trial_new)

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
result <- 
  ecom2 %>%
  select(referrer, device) 

result
nrow(result)

result %>% 
  collect() %>% 
  nrow()

## ----mysql simulate------------------------------------------------------
ecom2 %>% 
  group_by(referrer) %>% 
  summarise(avg_tos = mean(duration))  %>% 
  sql_render(simulate_mysql())

## ----bar plot------------------------------------------------------------
ecom2 %>% 
  dbplot::dbplot_bar(device) + xlab("Device") + ylab("Count") + ggtitle("Device Distribution")

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
  modeldb::linear_regression_db(duration)

## ----categorical variables-----------------------------------------------
ecom2 %>% 
  select(duration, device) %>%
  add_dummy_variables(device, values = c("laptop", "mobile", "tablet")) %>%
  modeldb::linear_regression_db(duration)

## ----full example--------------------------------------------------------
ecom2 %>% 
  select(duration, n_visit, n_pages, device) %>%
  add_dummy_variables(device, values = c("laptop", "mobile", "tablet")) %>%
  modeldb::linear_regression_db(duration, auto_count = TRUE)

## ----linear model--------------------------------------------------------
model <- lm(duration ~ device + referrer + n_visit + n_pages, data = ecom2)
model

## ----add fitted values in a new column-----------------------------------
ecom2 %>% 
  tidypredict_to_column(model) %>% 
  select(duration, fit)

## ----tidy eval formula-------------------------------
tidypredict_fit(model)

## ----use R code generated by tidypredict_fit to calculate fitted values--
ecom2 %>%
  mutate(
    fit = 441.450192491919 + (ifelse(device == "mobile", 1, 0) *
      -30.9522074131866) + (ifelse(device == "tablet", 1,
      0) * -14.4972018107797) + (ifelse(referrer == "direct",
      1, 0) * -8.98035001912995) + (ifelse(referrer == "google",
      1, 0) * -10.038005625893) + (ifelse(referrer == "social",
      1, 0) * -19.8411767075006) + (ifelse(referrer == "yahoo",
      1, 0) * -32.0969778768984) + (n_visit * -1.4325653130794) +
      (n_pages * -8.29825840984566)
    ) %>%
  select(duration, fit)


## ----sql translation of above step---------------------------------------
tidypredict_sql(model, con)

## ----disconnect----------------------------------------------------------
DBI::dbDisconnect(con)

## ----use rstudioapi------------------------------------------------------
db_con <- dbConnect(drv      = RMySQL::MySQL(), 
                    username = rstudioapi::askForPassword("Database Username"),
                    password = rstudioapi::askForPassword("Database Password"),
                    host     = "mysql-ecom.cowqoftkc0gy.us-east-2.rds.amazonaws.com", 
                    port     = 3306, 
                    dbname   = "mysql_test")

## ----use .Renviron-------------------------------------------------------
db_con <- dbConnect(drv      = RMySQL::MySQL(), 
                    username = Sys.getenv("db_uid"), 
                    password = Sys.getenv("db_pwd"), 
                    host     = "mysql-ecom.cowqoftkc0gy.us-east-2.rds.amazonaws.com", 
                    port     = 3306, 
                    dbname   = "mysql_test")

## ----use options---------------------------------------------------------
source("options.R")
db_con <- dbConnect(drv      = RMySQL::MySQL(), 
                    username = getOption("db_userid"), 
                    password = getOption("db_password"), 
                    host     = "mysql-ecom.cowqoftkc0gy.us-east-2.rds.amazonaws.com", 
                    port     = 3306, 
                    dbname   = "mysql_test")

## ----use config----------------------------------------------------------
md <- config::get("mysql-dev")

db_con <- dbConnect(drv      = RMySQL::MySQL(), 
                    username = md$username,
                    password = md$password,
                    host     = md$host, 
                    port     = md$port, 
                    dbname   = md$dbname)
