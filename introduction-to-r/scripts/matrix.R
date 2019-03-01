## ----mat1----------------------------------------------------------------
args(matrix)

## ----mat2, collapse=TRUE-------------------------------------------------
# matrix of 3 rows filled by columns
mat <- matrix(data = 1:9, nrow = 3, byrow = FALSE)
mat

## ----mat3, collapse=TRUE-------------------------------------------------
matrix(data = 1:9, nrow = 2, byrow = FALSE)
matrix(data = 1:10, nrow = 3, byrow = FALSE)

## ----mat4----------------------------------------------------------------
matrix(data = 1:9, nrow = 3, byrow = TRUE)

## ----mat5----------------------------------------------------------------
matrix(data = 1:9, nrow = 3, byrow = FALSE)

## ----mat6----------------------------------------------------------------
matrix(data = 1:10, nrow = 2)

## ----mat7----------------------------------------------------------------
matrix(data = 1:10, ncol = 5)

## ----mat8, collapse=TRUE-------------------------------------------------
# character vector
first_name <- 	c("John", "Jill", "Jack")

# numeric vector
age <- c(20, 24, 32)

# list 
details <- list(first_name, age)
details

## ----mat9, collapse=TRUE-------------------------------------------------
# row names
row_names <- c('row_1', 'row_2', 'row_3')

# column names
col_names <- c('col_1', 'col_2', 'col_3')

# matrix with row and column names
matrix(data = 1:9, nrow = 3, dimnames = list(row_names, col_names))

## ----mat10---------------------------------------------------------------
mat <- matrix(data = 1:9, nrow = 3, byrow = TRUE)
dim(mat)

## ----mat11, collapse=TRUE------------------------------------------------
# sample matrix
mat <- matrix(data = 1:12, nrow = 3, byrow = TRUE)
dim(mat)

# change the dimension to 4 x 3
dim(mat) <- c(4, 3)
dim(mat)

## ----mat12, collapse=TRUE------------------------------------------------
# numeric vector
vect1 <- 1:12
vect1

# coerce vect1 to a 4 x 3 matrix
dim(vect1) <- c(4, 3)
vect1

## ----mat13, collapse=TRUE------------------------------------------------
# numeric vector
vect1 <- 1:12
vect1

# coerce vect1 to a matrix
as.matrix(vect1)

## ----mat20, collapse=TRUE------------------------------------------------
# 3 x 3 matrix
mat <- matrix(data = 1:9, nrow = 3)
mat

# numeric vector
v <- c(10, 11, 12)
v

# append row
rbind(mat, v)

# append column
cbind(mat, v)

## ----mat21, collapse=TRUE------------------------------------------------
# 3 x 3 matrix
mat1 <- matrix(data = 1:9, nrow = 3)
mat2 <- matrix(data = sample(9), nrow = 3)

# append rows
rbind(mat1, mat2)

# append columns
cbind(mat1, mat2)

## ----mat22, collapse=TRUE------------------------------------------------
# 3 x 4 matrix
mat <- matrix(data = 1:12, nrow =3)
mat

# extract element from first row, first column
mat[1, 1]

# extract all rows of first column
mat[, 1]

# extract all columns of first row
mat[1,]

# extract 2nd and 3rd row of first column
mat[c(2, 3), 1]

# extract 2nd and 3rd column of first row
mat[1, c(2, 3)]

# extract 2nd and 3rd row of first and third column
mat[c(2, 3), c(1, 3)]

## ----mat23, collapse=TRUE------------------------------------------------
# row names
row_names <- c('row_1', 'row_2', 'row_3')

# column names
col_names <- c('col_1', 'col_2', 'col_3')

# matrix with row and column names
mat <- matrix(data = 1:9, nrow = 3, dimnames = list(row_names, col_names))

# extract elements from first row/columns
mat['row_1', 'col_1']

# extract all rows of first column
mat[, 'col_1']

# extract all columns of first row
mat['row_1',]

## ----mat24, collapse=TRUE------------------------------------------------
# 3 x 4 matrix
mat <- matrix(data = 1:12, nrow =3)
mat

# elements greater than 4
mat > 4

# extract elements greater than 4
mat[mat > 4]

## ----mat25, collapse=TRUE------------------------------------------------
# 3 x 3 matrix
mat <- matrix(data = 1:9, nrow =3)
mat

# using c()
c(mat)

# using as.vector()
as.vector(mat)

