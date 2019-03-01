# install 
install.packages('readxl')

# load
library(readxl)

# list sheets
excel_sheets('data/sample.xls')

# read data from sheet
read_excel('data/sample.xls', sheet = 'ecom')
read_excel('data/sample.xls', sheet = 3)

# read data from specific cells
read_excel('data/sample.xls', sheet = 3, range = 'B1:C4')
read_excel('data/sample.xls', sheet = 3,
           range = anchored('B1', dim = c(4, 2)))
read_excel('data/sample.xls', sheet = 3,
           range = cell_limits(c(1, 2), c(4, 3)))

# read data from particular columns
read_excel('data/sample.xls', sheet = 3, range = cell_cols(c(2, 3)))

# read data from particular rows
read_excel('data/sample.xls', sheet = 3, range = cell_rows(1:5))

# haven
library(haven)

# sas
read_sas('data/airline.sas7bdat')

# spss
read_spss('data/employee.sav')

# stata
read_stata('data/airline.dta')





