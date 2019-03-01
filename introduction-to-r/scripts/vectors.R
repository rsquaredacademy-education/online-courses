## ----vect1, collapse=TRUE------------------------------------------------
# create a numeric vector
num_vect <- c(1, 2, 3)

# display the vector
num_vect

# check if it is a vector
is.vector(num_vect)

# check data type
class(num_vect)

## ----vect2, collapse=TRUE------------------------------------------------
# using colon
vect1 <- 1:10
vect1

# using rep
vect2 <- rep(1, 5)
vect2

# using seq
vect3 <- seq(10)
vect3

## ----vect8, collapse=TRUE------------------------------------------------
# create vector and add names later
vect1 <- c(1, 2, 3)

# name the elements of the vector
names(vect1) <- c("One", "Two", "Three")

# call vect1
vect1

## ----vect9, collapse=TRUE------------------------------------------------
# specify names while creating vector
vect2 <- c(John = 1, Jack = 2, Jill = 3, Jovial = 4)

# call vect2
vect2

## ----vect10, collapse=TRUE-----------------------------------------------
# vector of different data types
vect1 <- c(1, 1L, 'one', TRUE)

# call vect1
vect1

# check data type
class(vect1)

## ----vect11, collapse=TRUE-----------------------------------------------
# vector of different data types
vect1 <- c(1, 1L, TRUE)

# call vect1
vect1

# check data type
class(vect1)

## ----vect12, collapse=TRUE-----------------------------------------------
# vector of different data types
vect1 <- c(1L, TRUE)

# call vect1
vect1

# check data type
class(vect1)

## ----vect13, collapse=TRUE-----------------------------------------------
# create two vectors
vect1 <- c(1, 3, 8, 4)
vect2 <- c(2, 7, 1, 9)

# addition
vect1 + vect2

# subtraction
vect1 - vect2

# multiplication
vect1 * vect2

# division
vect1 / vect2

## ----vect14, collapse=TRUE-----------------------------------------------
# create two vectors
vect1 <- c(2, 7)
vect2 <- c(1, 8, 5, 2)

# addition
vect1 + vect2

# subtraction
vect1 - vect2

# multiplication
vect1 * vect2

# division
vect1 / vect2

## ----vect15, collapse=TRUE-----------------------------------------------
# vector with missing values
vect1 <- c(1, 3, NA, 5, 2)

# use is.na
is.na(vect1)

# use complete.cases
complete.cases(vect1)

## ----vect16, collapse=TRUE-----------------------------------------------
# vector with missing values
vect1 <- c(1, 3, NA, 5, 2)

# call vect1
vect1

# omit missing values
na.omit(vect1)

## ----vect17, collapse=TRUE-----------------------------------------------
# vector with missing values
vect1 <- c(1, 3, NA, 5, 2)

# compute mean
mean(vect1)

# compute mean by excluding missing value
mean(vect1, na.rm = TRUE)

## ----vect30, collapse=TRUE-----------------------------------------------
# random sample of 10 values
vect1 <- sample(10)
vect1

# return third element
vect1[3]

# return seventh element
vect1[7]	

## ----vect31, collapse=TRUE-----------------------------------------------
# random sample of 10 values
vect1 <- sample(10)
vect1

# return value at index 0
vect1[0]

# length of the vector
length(vect1)

# out of range index
vect1[11]	

## ----vect32, collapse=TRUE-----------------------------------------------
# random sample of 10 values
vect1 <- sample(10)
vect1

# drop third element
vect1[-3]

# drop seventh element
vect1[-7]	

## ----vect33, collapse=TRUE-----------------------------------------------
# random sample of 10 values
vect1 <- sample(10)
vect1

# return all elements
vect1[]

# return first 5 values
vect1[1:5]

# return all values from the 5th position
end <- length(vect1)
vect1[5:end]

## ----vect34, collapse=TRUE-----------------------------------------------
# random sample of 10 values
vect1 <- sample(10)
vect1

# extract 2nd, 5th and 7th element
select <- c(2, 5, 7)
vect1[select]

# extract elements in position 1 to 4, 6 and 9
select <- c(1:4, 6, 9)
vect1[select]

## ----vect35, collapse=TRUE-----------------------------------------------
vect1 <- c(score1 = 8, score2 = 6, score3 = 9)
vect1

# extract score2
vect1['score2']

# extract score1 and score3
vect1[c('score1', 'score3')]

## ----vect36, collapse=TRUE-----------------------------------------------
# random sample of 10 values
vect1 <- sample(10)
vect1

# returns all values
vect1[TRUE]

# empty vector
vect1[FALSE]

# values in odd positions
vect1[c(TRUE, FALSE)]

# values in even positions
vect1[c(FALSE, TRUE)]

## ----vect37, collapse=TRUE-----------------------------------------------
# random sample of 10 values
vect1 <- sample(10)
vect1

# return elements greater than 5
vect1 > 5
vect1[vect1 > 5]

# return elements greater than or equal to 5
vect1 >= 5
vect1[vect1 >= 5]

# return elements lesser than 5
vect1 < 5
vect1[vect1 < 5]

# return elements lesser than or equal to 5
vect1 <= 5
vect1[vect1 <= 5]

# return elements equal to 5
vect1 == 5
vect1[vect1 == 5]

# return elements not equal to 5
vect1 != 5
vect1[vect1 != 5]

## ----vect38, collapse=TRUE-----------------------------------------------
# random sample of 10 values
vect1 <- sample(10)
vect1

# return all elements less than 8 or divisible by 3
vect1[(vect1 < 8 | (vect1 %% 3 == 0))]

# return all elements less than 7 or divisible by 2
vect1[(vect1 < 7 | (vect1 %% 2 == 0))]

