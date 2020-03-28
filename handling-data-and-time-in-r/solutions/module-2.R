# using character
as.Date('2000-02-29')

# using origin and number
as.Date(11016, origin = '1970-01-01')

# POSIXct
as.POSIXct('2000-02-29 08:55:23', tz = 'UTC')

# POSIXlt
release_v1 <- as.POSIXlt('2000-02-29 08:55:23', tz = "UTC")
release_v1$mday    # month day
release_v1$yday    # day of year
release_v1$mon     # month

# ISO Date
ISOdate(year  = 2000,
        month = 02,
        day   = 29,
        hour  = 08,
        min   = 55, 
        sec   = 23,
        tz    = "UTC")
