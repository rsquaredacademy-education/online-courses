# install 
install.packages('readr')

# load
library(readr)

# read csv file
read_csv('data/hsb2.csv')
read_csv('G:/course/data/hsb2.csv')

# file is in the same folder 
read_csv('hsb2.csv')
read_csv('G:/course/hsb2.csv')

# file is in a different folder
read_csv('../data/hsb2.csv')
read_csv('G:/data/hsb2.csv')

# column names
read_csv('data/hsb3.csv')
read_csv('data/hsb3.csv', col_names = FALSE)
read_csv('data/hsb3.csv', col_names = column_names)

column_names <- c("id","female","race","ses","schtyp","prog",
                  "read","write","math","science","socst")

# skip lines
read_csv('data/hsb4.csv')
read_csv('data/hsb4.csv', skip = 25)

# maximum lines
read_csv('data/hsb2.csv', n_max = 100)

# column data types
read_csv('data/hsb2.csv')
spec_csv('data/hsb2.csv')

# specify column types
read_csv('data/hsb2.csv', 
         col_types = list(col_factor(levels = c(0, 1)),
                          col_factor(levels = c(1, 2, 3)),
                          col_integer(), col_integer(),
                          col_double(), col_logical()))


# skip columns
read_csv('data/hsb2.csv',
         col_types = list(col_skip(), col_skip(),
                          col_integer(), col_integer(),
                          col_double(), col_logical()))

# read specific columns
read_csv('data/hsb2.csv',
         col_types = cols_only(read = col_integer(),
                               write = col_integer()))


























