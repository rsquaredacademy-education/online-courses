## ----df1-----------------------------------------------------------------
args(data.frame)

## ----df2, collapse=TRUE--------------------------------------------------
name     <- c('John', 'Jack', 'Jill')
age      <- c(29, 25, 27)
graduate <- c(TRUE, TRUE, FALSE)
students <- data.frame(name, age, graduate)

students

## ----df3, collapse=TRUE--------------------------------------------------
class(students)

# column names
names(students)

# column names
colnames(students)

# structure
str(students)

# dimension
dim(students)

# number of rows
nrow(students)

# number of columns
ncol(students)

## ----df4, collapse=TRUE--------------------------------------------------
# using [
students[1]

# using [[
students[[1]]

# using $
students$name

## ----df5, collapse=TRUE--------------------------------------------------
students[, 1:3]

students[, c(1, 3)]

## ----df6, collapse=TRUE--------------------------------------------------
# single row
students[1, ]

# multiple row
students[c(1, 3), ]

## ----df7-----------------------------------------------------------------
students <- data.frame(name, age, graduate, stringsAsFactors = FALSE)

