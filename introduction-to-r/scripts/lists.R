## ----list1, collapse=TRUE------------------------------------------------
# numeric vector
vect1 <- 1:10

# character vector 
vect2 <- c('Jack', 'John', 'Jill')

# logical vector
vect3 <- c(TRUE, FALSE)

# matrix
mat <- matrix(data = 1:9, nrow = 3)

# list
l <- list(vect1, vect2, vect3, mat)
l

## ----list2, collapse=TRUE------------------------------------------------
# using [[
l[[1]]

# using [
l[1]

## ----list3, collapse=TRUE------------------------------------------------
# named elements
names(l) <- c('vect1', 'vect2', 'vect3', 'mat')
l

# use $
l$vect1

# use [[
l[['vect1']]

# use [
l['vect1']

## ----list4, collapse=TRUE------------------------------------------------
# vector
vect1 <- 1:3
as.list(vect1)

# matrix
mat <- matrix(data = 1:4, nrow = 2)
as.list(mat)

## ----list5, collapse=TRUE------------------------------------------------
# unlist
unlist(l)

# remove names
unlist(l, use.names = FALSE)

