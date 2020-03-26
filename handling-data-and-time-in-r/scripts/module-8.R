## ----create date-----------------------------------------
make_date(year  = 2019,
          month = 12,
          day   = 12)


## ----create date and time--------------------------------
make_datetime(year  = 2019,
              month = 12,
              day   = 12,
              hour  = 08,
              min   = 05,
              sec   = 03,
              tz    = "UTC")


## ----update date-----------------------------------------
prev_release <- ymd("2019-07-05")
prev_release %>% 
  update(year  = 2019,
         month = 12,
         mday  = 12)


## ----date sequence---------------------------------------
# create a sequence of dates from 2010-01-01 to 2019-12-31
seq.Date(from = as.Date("2010-01-01"), to = as.Date("2019-12-31"), by = "year")


# change the unit of increment to a quarter
seq.Date(from = as.Date("2009-12-12"), to = as.Date("2019-12-12"), by = "quarter")


# specify the number of dates in the sequence
seq.Date(from = as.Date("2010-01-01"), to = as.Date("2019-12-31"), length.out = 10)


# create a sequence of dates using start date and increment
seq.Date(from = as.Date("2010-01-01"), by = "year", length.out = 10)


# increment the dates in the sequence by 2
seq.Date(from = as.Date("2010-01-01"), by = "2 year", length.out = 10)


# decrement the dates
seq.Date(from = as.Date("2010-01-01"), by = "-2 year", length.out = 10)


# use along.with argument
seq.Date(from = as.Date("2010-01-01"), by = "-2 year", along.with = 1:10)


## ----check data type-------------------------------------
is.Date(release_date)
is.POSIXct(release_date)
is.POSIXlt(release_date)


