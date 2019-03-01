## ----var1----------------------------------------------------------------
3.14 * 3 * 3

## ----var2----------------------------------------------------------------
radius <- 3
radius

## ----var3----------------------------------------------------------------
# assign value 3 to variable radius
radius <- 3

# assign value 3.14 to variable pi
pi <- 3.14

# compute area of circle
area <- pi * radius * radius

# call radius
radius

# call area
area

## ----dtype1, collapse=TRUE-----------------------------------------------
# create two variables
number1 <- 3.5
number2 <- 3

# check data type
class(number1)
class(number2)

# check if data type is numeric
is.numeric(number1)
is.numeric(number2)

## ----dtype2, collapse=TRUE-----------------------------------------------
# create a variable and assign it an integer value
number1 <- 3

# create another variable using as.integer
number2 <- as.integer(3)

# check the data type
class(number1)
class(number2)

# use is.integer to check data type
is.integer(number1)
is.integer(number2)

## ----dtype3, collapse=TRUE-----------------------------------------------
# first name
first_name <- "jovial"

# last name
last_name <- 'mann'

# check data type
class(first_name)
class(last_name)

# use is.charactert to check data type
is.character(first_name)
is.character(last_name)

## ----dtype4, collapse=TRUE-----------------------------------------------
# create variable of different data types
age        <- as.integer(30) # integer
score      <- 9.8            # numeric/double
opt_course <- TRUE           # logical
today      <- Sys.time()     # date time

as.character(age)
as.character(score)
as.character(opt_course)
as.character(today)

## ----dtype5, collapse=TRUE-----------------------------------------------
# create variables x and y
x <- TRUE
y <- FALSE

# check data type
class(x)
is.logical(y)

## ----dtype6, collapse=TRUE-----------------------------------------------
# create two numeric variables
x <- 3
y <- 4

# compare x and y
x > y
x < y

# store the result
z <- x > y
class(z)

## ----dtype7, collapse=TRUE-----------------------------------------------
# TRUE and FALSE are represented by 1 and 0
as.logical(1)
as.logical(0)

# using numbers
as.numeric(TRUE)
as.numeric(FALSE)

# using different numbers
as.logical(-2, -1.5, -1, 0, 1, 2)

## ----dtype8, collapse=TRUE-----------------------------------------------
# create variable of different data types
age        <- as.integer(30) # integer
score      <- 9.8            # numeric/double
opt_course <- TRUE           # logical
today      <- Sys.time()     # date time

as.logical(age)
as.logical(score)
as.logical(opt_course)
as.logical(today)

