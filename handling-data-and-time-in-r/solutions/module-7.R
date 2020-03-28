# load package
library(lubridate)
library(rversions)

# r release dates
release_dates <- r_versions()$date

# extract components
table(year(release_dates))                 # year
table(month(release_dates, label = TRUE))  # month with label
table(wday(release_dates, label = TRUE))   # weekday with label
table(hour(release_dates))                 # hour
table(quarter(release_dates))              # quarter
