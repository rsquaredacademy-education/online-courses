## ----packages--------------------------------------------
library(knitr)
library(kableExtra)
library(magrittr)
library(lubridate)
library(rversions)
library(readr)
library(dplyr)


## ----date------------------------------------------------
Sys.Date()
lubridate::today()


## ----time------------------------------------------------
Sys.time()
lubridate::now()
lubridate::now(tzone = "UTC")


## ----am_pm-----------------------------------------------
lubridate::am(now())
lubridate::pm(now())


## ----leap year-------------------------------------------
lubridate::leap_year(Sys.Date())


