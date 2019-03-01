# install.packages('dplyr')
# install.packages('tidyverse')
library(dplyr)
library(readr)

# read data
ecom <- 
  read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/web.csv',
           col_types = cols_only(device = col_factor(levels = c("laptop", "tablet", "mobile")),
                                 referrer = col_factor(levels = c("bing", "direct", "social", "yahoo", "google")),
                                 purchase = col_logical(), bouncers = col_logical(), duration = col_double(),
                                 n_visit = col_double(), n_pages = col_double()
           )
  )

# distinct values
distinct(ecom, referrer)
distinct(ecom, device)

# rename
rename(ecom, time_on_site = duration)

# sampling
sample_n(ecom, size = 700)
sample_frac(ecom, size = 0.7)

# extract data
select(ecom, device)
pull(ecom, device)
pull(ecom, 2)
pull(ecom, 1)
pull(ecom, -1)

# extract rows
slice(ecom, 3:8)
slice(ecom, n())

# tally
ecom %>%
  group_by(referrer) %>%
  tally()

tally(group_by(ecom, referrer), sort = TRUE)

count(ecom, referrer)
count(ecom, referrer, sort = TRUE)

# betwen
between(pull(ecom, n_pages), 5, 15)

# case when
ecom %>%
  mutate(
    repeat_visit = case_when(
      n_visit > 0 ~ TRUE,
      TRUE ~ FALSE
    )
  )

ecom %>%
  mutate(
    traffic = case_when(
      referrer == "bing" | referrer == "yahoo" | referrer == "google" ~ "search",
      referrer == "social" ~ "social_media",
      TRUE ~ "direct"
    )
  ) %>%
  View()














