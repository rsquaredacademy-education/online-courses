## ----date arithmetic-------------------------------------
course_start    <- as_date('2017-04-12')
course_end      <- as_date('2017-04-21')
course_duration <- course_end - course_start
course_duration

## ----shift dates-----------------------------------------
course_start + days(2)
course_start + weeks(3)
course_start + years(1)





