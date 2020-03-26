## ----year------------------------------------------------
release_date <- ymd_hms("2019-12-12 08:05:03")
year(release_date) 


## ----month-----------------------------------------------
month(release_date)


## ----month with label------------------------------------
month(release_date, label = TRUE)


## ----month without abbreviation--------------------------
month(release_date, label = TRUE, abbr  = FALSE)


## ----month using base R----------------------------------
months(release_date)


## ----week------------------------------------------------
week(release_date)

## ----day-------------------------------------------------
day(release_date)
mday(release_date)                 
qday(release_date)                 
yday(release_date)                 


## ----day with label & abbreviation options---------------
wday(release_date)  
wday(release_date, label = TRUE)
wday(release_date, label = TRUE, abbr  = FALSE)  


## ----weekdays--------------------------------------------
weekdays(release_date)
weekdays(release_date, abbreviate = TRUE)


## ----days in a month-------------------------------------
days_in_month(release_date)


## ----hour/minute/second----------------------------------
hour(release_date)
minute(release_date)
second(release_date)


## ----seconds---------------------------------------------
seconds(release_date)


## ----quarter_--------------------------------------------
quarter(release_date)


## ----quarter with year-----------------------------------
quarter(release_date, with_year = TRUE)


## ----quarter with different fiscal start month-----------
quarter(release_date, fiscal_start = 4)    


## ----quarter using base R--------------------------------
quarters(release_date)




