# How to connect database in RStudio
# Reference Book : SQL Pocket Guide
library(DBI)
con <- dbConnect(RSQLite::SQLite(), 
                 "my_new_db.db")

# list tables
dbListTables(con)

# read table
dbReadTable(con, "test")

# create a query and save query results into a dataframe
df <- dbGetQuery(con, "SELECT * FROM test WHERE id = 3")

# show the results
print(df)
class(df)

# disconnect database
dbDisconnect(con)
