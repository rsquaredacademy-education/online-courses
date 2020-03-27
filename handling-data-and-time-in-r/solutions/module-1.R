# load packages
library(lubridate)

# current date
Sys.Date()
lubridate::today()

# current time
Sys.time()
lubridate::now()

# am or pm
lubridate::am(Sys.time())
lubridate::pm(Sys.time())

# leap year
lubridate::leap_year(2018)
lubridate::leap_year(2016)
