# load package
library(lubridate)
library(rversions)

# r release dates
release_dates <- r_versions()$date

# round up R release dates to hours
round_date(release_dates, unit = "hour")

# round down R release dates to minutes
round_date(release_dates, unit = "mins")

# rollback R release dates to the beginning of the month
rollback(release_dates, roll_to_first = TRUE)
