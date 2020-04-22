# load DBI
library(DBI)

# connect
con <- DBI::dbConnect(RSQLite::SQLite(), dbname = "data/hr-sample.db")

# list table
dbListTables(con)

# disconnect
dbDisconnect(con)
