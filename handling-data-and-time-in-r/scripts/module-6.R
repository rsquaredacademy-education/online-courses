## ----convert character data to POSIXlt-------------------
rel_date <- strptime("20191212", format = "%Y%m%d")
class(rel_date)


## ----convert date/time to character data-----------------
rel_date_strf <- strftime(rel_date)
class(rel_date_strf)

rel_date_format <- format(rel_date)
class(rel_date_format)

rel_date_char <- as.character(rel_date)
class(rel_date_char)


## ----parse date time-------------------------------------
release_date <- c("19-12-12", "20191212", "19-12 12")
parse_date_time(release_date, "ymd")
parse_date_time(release_date, "y m d")
parse_date_time(release_date, "%y%m%d")


## ----parse date time from multiple formats---------------
release_date <- c("19-07-05", "2019-07-05", "05-07-2019", "07-05-2019")
parse_date_time(release_date, c("ymd", "ymd", "dmy", "mdy"))


## ----helper functions------------------------------------
# year/month/date
ymd("2019-12-12")

# year/month/date
ymd("19/12/12")

# date/month/year
dmy(121219)

# year/month/date/hour/minute/second
ymd_hms(191212080503)

# hour/minute/second
hms("8, 5, 3")

# hour/minute/second
hms("08:05:03")

# minute/second
ms("5,3")

# hour/minute
hm("8, 5")


