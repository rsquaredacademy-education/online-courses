# load packages
library(lubridate)

# check the time zone you live in
Sys.timezone()
lubridate::tz(Sys.time())

# check if daylight savings is on
lubridate::dst(Sys.Date())

# check the current time in UTC
lubridate::with_tz(Sys.time(), "UTC")
