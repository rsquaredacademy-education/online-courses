# load packages
library(lubridate)
library(readr)
library(dplyr)

# length of vacation
vacation_start    <- as_date('2020-04-19')
vacation_end      <- as_date('2020-04-25')
vacation_length   <- vacation_end - vacation_start
vacation_length

# shift vacation dates
vacation_start  <- vacation_start + days(10)
vacation_end    <- vacation_end + weeks(2)
vacation_length <- vacation_end - vacation_start
vacation_length

# receivables data
# read receivables.csv
receivables <- readr::read_csv("https://raw.githubusercontent.com/rsquaredacademy/datasets/master/receivables.csv",
               col_types = cols_only(
                 invoice_number = col_double(),
                 invoice_date = col_date(format = "%m/%d/%Y"),
                 due_date = col_date(format = "%m/%d/%Y"),
                 settled_date = col_date(format = "%m/%d/%Y")
                 )
               )
receivables

# days to settle invoice
receivables %>%
  dplyr::mutate(
    days_to_pay = settled_date - invoice_date
  ) %>% 
  dplyr::select(invoice_number, days_to_pay)


# compute days over due
receivables %>%
  dplyr::mutate(
    delay = as.numeric(due_date - settled_date)
  ) %>%
  dplyr::filter(delay < 0) %>%
  dplyr::mutate(
    delay = delay * -1
  ) %>% 
  dplyr::count(delay)

# hr data set
# read data
hr_data <- readr::read_csv("https://raw.githubusercontent.com/rsquaredacademy/datasets/master/hr-data.csv",
                          col_types = cols_only(
                            Employee_Name = col_character(),
                            DateofHire = col_date(format = "%m/%d/%Y"),
                            DateofTermination = col_date(format = "%m/%d/%y")
                          ))

# length of employment
hr_data %>% 
  dplyr::filter(!is.na(DateofTermination)) %>% 
  dplyr::mutate(
    longevity = DateofTermination - DateofHire
  )
