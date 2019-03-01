library(magrittr)
library(readr)
library(dplyr)
library(stringr)

# read data
ecom <- 
  read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/web.csv',
           col_types = cols_only(
             referrer = col_factor(levels = c("bing", "direct", "social", "yahoo", "google")),
             n_pages = col_double(), duration = col_double(), purchase = col_logical()
           )
  )

ecom

# sample data set
ecom_mini <- sample_n(ecom, size = 10)

# head
head(ecom, 10)
ecom %>% head(10)

# square root
y <- sqrt(ecom_mini$n_pages)

ecom_mini %$% n_pages
ecom_mini$n_pages

# using pipe
ecom_mini %$%
  n_pages %>%
  sqrt() -> y

ecom_mini %$%
  n_pages -> y

y <- sqrt(y)
y %<>% sqrt()


# correlation
ecom1 <- subset(ecom, purchase)
cor( ecom1$n_pages,ecom1$duration)

# using pipe
ecom %>%
  subset(purchase) %$%
  cor(n_pages, duration)

ecom %>%
  filter(purchase) %$%
  cor(n_pages, duration)


# bar plot
subset(ecom, purchase)
subset(ecom, purchase)$referrer
table(subset(ecom, purchase)$referrer)
barplot(table(subset(ecom, purchase)$referrer))

# using pipe
ecom %>%
  subset(purchase) %>%
  extract('referrer') %>%
  table() %>%
  barplot()

# regression
summary(lm(duration ~ n_pages, data = ecom))

# using pipe
ecom %$%
  lm(duration ~ n_pages) %>%
  summary()


email <- "jovialcann@anymail.com"

email %>%
  str_split(pattern = "@") %>%
  extract2(1) %>%
  extract(1) %>%
  str_sub(start = 1, end = 6) %>%
  str_to_upper()


# data extraction
ecom_mini['n_pages']
extract(ecom_mini, 'n_pages')

ecom_mini[2]
extract(ecom_mini, 2)

ecom_mini$n_pages
use_series(ecom_mini, 'n_pages')

# list
ecom_list <- as.list(ecom_mini)

ecom_list[['n_pages']]
ecom_list$n_pages
ecom_list[[1]]

extract2(ecom_list, 'n_pages')
use_series(ecom_list, n_pages)
extract2(ecom_list, 1)



































