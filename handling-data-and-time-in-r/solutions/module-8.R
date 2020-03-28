# load package
library(lubridate)

# date
make_date(year  = 2004,
          month = 10,
          day   = 04)

# date and time
make_datetime(year  = 2004,
              month = 10,
              day   = 04,
              hour  = 14,
              min   = 24,
              sec   = 38)

# update date
r2_release <- 
  make_datetime(year  = 2004,
                month = 10,
                day   = 04,
                hour  = 14,
                min   = 24,
                sec   = 38)

update(r2_release,
       year  = 2013,
       month = 04,
       day   = 03,
       hour  = 07,
       min   = 12,
       sec   = 36)
