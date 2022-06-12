
# Connect PostgreSQL with R -----------------------------------------------
# https://db.rstudio.com/databases/postgresql/
# https://www.datacareer.de/blog/connect-to-postgresql-with-r-a-step-by-step-example/
# this query and visuliation are related to NYC taxi data set from 
# https://github.com/anthonydb/practical-sql-2

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
             FROM nyc_yellow_taxi_trips
             LIMIT 5'
df_nyc_taxi <- dbGetQuery(con, my_query)
df_nyc_taxi

my_query_hourly <- "SELECT 
		                  date_part('hour', tpep_pickup_datetime) as trip_hour,
		                  count(*)
	                  FROM nyc_yellow_taxi_trips 
	                  GROUP BY trip_hour 
	                  ORDER BY trip_hour;"

df_hourly_taxi_pickups <- dbGetQuery(con, my_query_hourly)

# Plot the hourly trend in a day ------------------------------------------

library(ggplot2)
library(dplyr)

df_hourly_taxi_pickups %>% 
  ggplot(aes(x = trip_hour, y = as.numeric(count)))+
  geom_line()+
  labs(title = "Hourly Taxi Trips")+
  xlab("Hour")+
  ylab("Number of Taxi Trips")

