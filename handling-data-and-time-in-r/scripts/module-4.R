## ----time zone-------------------------------------------
Sys.timezone()


## ----get time zone from environment variable-------------
Sys.getenv("TZ")


## ----set time zone using environment variable------------
Sys.setenv(TZ = "Asia/Calcutta")


## ----tz lubridate----------------------------------------
lubridate::tz(Sys.time())


## ----view time in a different time zone------------------
lubridate::with_tz(Sys.time(), "UTC")


## ----day light savings-----------------------------------
dst(Sys.Date()) 


