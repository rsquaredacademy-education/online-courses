## ----case study data-------------------------------------
transact <- readr::read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/transact.csv')
transact


## ----date manual-----------------------------------------
release_date <- 2019-12-12
release_date


## ----date type-------------------------------------------
class(release_date)


## ----date character--------------------------------------
release_date <- "2019-12-12"
release_date


## ----check date type-------------------------------------
class(Sys.Date())
class(lubridate::now())
class(release_date)


## ----unclass sys date------------------------------------
unclass(Sys.Date())


## ----release date----------------------------------------
release_date <- as.Date("2019-12-12")
release_date


## ----release date using lubridate------------------------
release_date <- lubridate::as_date("2019-12-12")
release_date


## ----release date unclass--------------------------------
release_date - as.Date("1970-01-01")
unclass(release_date)


## ----origin----------------------------------------------
lubridate::origin


## ----date older than origin------------------------------
unclass(as.Date("1963-08-28"))


## ----release date from origin----------------------------
as.Date(18242, origin = "1970-01-01")


## ----release date difference from origin-----------------
as.Date(7285, origin = "2000-01-01")

## ----iso date--------------------------------------------
ISOdate(year  = 2019,
        month = 12,
        day   = 12,
        hour  = 8,
        min   = 5, 
        sec   = 3,
        tz    = "UTC")


## ----now function class----------------------------------
class(lubridate::now())


## ----unclass now-----------------------------------------
unclass(lubridate::now())


## ----release date using posixct--------------------------
release_date <- as.POSIXct("2019-12-12 08:05:03")
class(release_date)
unclass(release_date) 


## ----release date using posixlt--------------------------
release_date <- as.POSIXlt("2019-12-12 08:05:03")
release_date


## ----unclass posixlt-------------------------------------
release_date <- as.POSIXlt("2019-12-12 08:05:03")
unclass(release_date)


## ----unlist posixlt--------------------------------------
release_date <- as.POSIXlt("2019-12-12 08:05:03")
unlist(release_date)


## ----poxixlt components----------------------------------
release_date <- as.POSIXlt("2019-12-12 08:05:03")
release_date$hour
release_date$mon
release_date$zone


