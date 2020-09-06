# SQL in R
# https://dept.stat.lsa.umich.edu/~jerrick/courses/stat701/notes/sql.html
# sqldf package -----------------------------------------------------------

library(sqldf)
sqldf('select age, circumference 
      from Orange 
      where Tree = 1 
      order by circumference asc')

# SQL Queries -------------------------------------------------------------

sqldf('select * from iris')
sqldf('select demand from BOD')
sqldf('select Time, demand from BOD')

iris1 <- sqldf('select "Petal.Width" from iris')
head(iris1)


# Wildcard ----------------------------------------------------------------
bod2 <- sqldf('SELECT * FROM BOD')
bod2


# LIMIT -------------------------------------------------------------------
sqldf('SELECT * FROM iris LIMIT 5')


# ORDER BY ----------------------------------------------------------------

sqldf("select * from Orange 
      order by age asc, circumference desc 
      limit 5")

# where -------------------------------------------------------------------
sqldf('select demand from BOD where Time < 3')
sqldf('select * from rock
      where (peri > 5000 and shape < 0.05) or perm > 1000')


# in ----------------------------------------------------------------------

sqldf('select * 
      from BOD
      where Time in (1, 7)')

sqldf('select * 
      from BOD
      where Time not in (1, 7)')

# like --------------------------------------------------------------------

sqldf('select * 
      from chickwts
      where feed like "%bean"
      limit 5')


# aggregated data ---------------------------------------------------------

sqldf("select avg(circumference) from Orange")
sqldf("select tree, avg(circumference) as meancirc
      from Orange
      group by tree")

# counting data -----------------------------------------------------------

d <- data.frame(a = c(1,1,1), b = c(1, NA, NA))
d
sqldf('select count() as numrows
      from d')
sqldf("select count(b) from d")
