## ----interval--------------------------------------------
course_start    <- as_date('2017-04-12')
course_end      <- as_date('2017-04-21')
interval(course_start, course_end)


## ----overlapping intervals-------------------------------
vacation_start    <- as_date('2017-04-19')
vacation_end      <- as_date('2017-04-25')
course_interval   <- interval(course_start, course_end)
vacation_interval <- interval(vacation_start, vacation_end)
int_overlaps(course_interval, vacation_interval)


## ----shift interval--------------------------------------
course_interval <- interval(course_start, course_end)

# shift course_interval by 1 day 
int_shift(course_interval, by = days(1))

# shift course_interval by 3 weeks
int_shift(course_interval, by = weeks(3))

# shift course_interval by 1 year
int_shift(course_interval, by = years(1))


## ----within----------------------------------------------
conference <- as_date('2017-04-15')
conference %within% course_interval


## ----duration--------------------------------------------
# seconds
duration(50, "seconds")
duration(second = 50)
duration(second = 60)

# minutes
duration(minute = 50)
duration(minute = 60)

# hours
duration(hour = 23)
duration(hour = 24)


## ----create duration objects-----------------------------
# default
dseconds()
dminutes()

# seconds
duration(second = 59)
dseconds(59)

# minutes
duration(minute = 50)
dminutes(50)

# hours
duration(hour = 36)
dhours(36)

# weeks
duration(week = 56)
dweeks(56)


## ----course length in different units--------------------
# course length in seconds 
course_interval / dseconds()

# course length in minutes
course_interval / dminutes()

# course length in hours
course_interval / dhours()

# course length in weeks
course_interval / dweeks()

# course length in years
course_interval / dyears()


## ----period examples-------------------------------------
# second
period(5, "second")
period(second = 5)

# minute & second
period(c(3, 5), c("minute", "second"))
period(minute = 3, second = 5)

# hour, minte & second
period(c(1, 3, 5), c("hour", "minute", "second"))
period(hour = 1, minute = 3, second = 5)

# day, hour, minute & second
period(c(3, 1, 3, 5), c("day", "hour", "minute", "second"))
period(day = 3, hour = 1, minute = 3, second = 5)


## ----course length using period--------------------------
# course length in second
as.period(course_interval, unit = "seconds")

# course length in hours and minutes
as.period(course_interval, unit = "minutes")

# course length in hours, minutes and seconds
as.period(course_interval, unit = "hours")



## ----time length-----------------------------------------
# course length in seconds
time_length(course_interval, unit = "seconds")

# course length in minutes
time_length(course_interval, unit = "minutes")

# course length in hours
time_length(course_interval, unit = "hours")


