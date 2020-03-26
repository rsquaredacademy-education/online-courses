## ----round dates-----------------------------------------
# minute
round_date(release_date, unit = "minute")
round_date(release_date, unit = "mins")
round_date(release_date, unit = "5 mins")

# hour
round_date(release_date, unit = "hour")

# day
round_date(release_date, unit = "day")


## ----rollback date---------------------------------------
rollback(release_date)

# rollback date to first of month
rollback(release_date, roll_to_first = TRUE)

