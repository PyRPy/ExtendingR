
# Connect PostgreSQL with R -----------------------------------------------
# https://db.rstudio.com/databases/postgresql/
# https://www.datacareer.de/blog/connect-to-postgresql-with-r-a-step-by-step-example/

library(DBI)
library(RPostgres)
library(RPostgreSQL)
db <- 'analysis'
host_db <- 'localhost'
db_port <- 5432
db_user <- 'postgres'
db_password <- 'pg2018'

con <- dbConnect(Postgres(), 
                 dbname = db, 
                 host=host_db, 
                 port=db_port, 
                 user=db_user, 
                 password=db_password)  

dbListTables(con)
my_query <- 'SELECT * 
             FROM teachers
             WHERE salary > 40000;
'
df_teachers <- dbGetQuery(con, my_query)
df_teachers
