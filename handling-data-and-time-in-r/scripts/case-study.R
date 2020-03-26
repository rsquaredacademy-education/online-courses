## ----packages--------------------------------------------
library(knitr)
library(kableExtra)
library(magrittr)
library(lubridate)
library(rversions)
library(readr)
library(dplyr)


## ----case study data-------------------------------------
transact <- readr::read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/transact.csv')
transact


# compute days to settle invoice
transact %>%
  mutate(
    days_to_pay = Payment - Invoice
  )


# compute days over due
transact %>%
  mutate(
    delay = Due - Payment
  ) %>%
  filter(delay < 0) %>%
  tally()


# extract the date, month and year from the Due column.
transact %>%
  mutate(
    due_day   = day(Due),
    due_month = month(Due),
    due_year  = year(Due)
  )


# data sanitization
transact %>%
  mutate(
    due_day   = day(Due),
    due_month = month(Due),
    due_year  = year(Due),
    is_leap   = leap_year(due_year)
  ) %>%
  filter(due_month == 2 & due_day == 29) %>%
  select(Due, is_leap) 


# count the invoices due for each quarter
transact %>%
  mutate(
    quarter_due = quarter(Due)
  ) %>%
  count(quarter_due)


# count the number of invoices that were settled within the due date
transact %>%
  mutate(
    inv_due_interval = interval(Invoice, Due),
    due_next         = Due + days(1),
    due_pay_interval = interval(due_next, Payment),
    overlaps         = int_overlaps(inv_due_interval, due_pay_interval)
  ) %>%
  select(Invoice, Due, Payment, overlaps)


# use int_shift
transact %>%
  mutate(
    inv_due_interval = interval(Invoice, Due),
    due_pay_interval = interval(Due, Payment),  
    due_pay_next     = int_shift(due_pay_interval, by = days(1)),
    overlaps         = int_overlaps(inv_due_interval, due_pay_next)
  ) %>%
  select(Invoice, Due, Payment, overlaps)


# use overlapping intervals
transact %>%
  mutate(
    inv_due_interval = interval(Invoice, Due),
    due_pay_interval = interval(Due, Payment),
    overlaps         = int_overlaps(inv_due_interval, due_pay_interval)
  ) %>%
  select(Invoice, Due, Payment, overlaps)


# count the number of invoices that were settled within the due date
transact %>%
  mutate(
    inv_due_interval = interval(Invoice, Due),
    overlaps         = Payment %within% inv_due_interval
  ) %>%
  select(Due, Payment, overlaps)
