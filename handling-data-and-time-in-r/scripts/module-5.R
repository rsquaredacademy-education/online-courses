## ----date format example 1-------------------------------
as.Date("19/12/12", format = "%y/%m/%d")


## ----date format example 2-------------------------------
as.Date("2019-Dec-12", format = "%Y-%b-%d")


## ----date format example 3-------------------------------
as.POSIXct("19/12/12 08:05:03", tz = "UTC", format = "%y/%m/%d %H:%M:%S")


## ----guess date formats----------------------------------
release_date_formats <- c("December 12th 2019",
                        "Dec 12th 19",
                        "dec 12 2019")

guess_formats(release_date_formats, 
              orders = "mdy", 
              print_matches = TRUE)


