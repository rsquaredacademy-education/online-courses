# load DBI
library(DBI)

# connect
con <- DBI::dbConnect(RSQLite::SQLite(), dbname = "data/northwind.sqlite")

# list tables
dbListTables(con)

# disconnect
dbDisconnect(con)
