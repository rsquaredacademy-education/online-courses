## ----packages------------------------------------------------------------
library(robotstxt)
library(rvest)
library(selectr)
library(xml2)
library(dplyr)
library(stringr)
library(forcats)
library(magrittr)
library(tidyr)
library(ggplot2)
library(lubridate)
library(tibble)
library(purrr)

## ----check robots.txt----------------------------------------------------
paths_allowed(
  paths = c("https://www.imdb.com/search/title?groups=top_250&sort=user_rating")
)

## ----read html-----------------------------------------------------------
imdb <- read_html("https://www.imdb.com/search/title?groups=top_250&sort=user_rating")
imdb

## ----extract movie title-------------------------------------------------
imdb %>%
  html_nodes(".lister-item-content h3 a") %>%
  html_text() -> movie_title

movie_title

## ----extract year of release---------------------------------------------
imdb %>%
  html_nodes(".lister-item-content h3 .lister-item-year") %>%
  html_text() %>%
  str_sub(start = 2, end = 5) %>%
  as.Date(format = "%Y") %>%
  year() -> movie_year

movie_year

## ----extract certificate-------------------------------------------------
imdb %>%
  html_nodes(".lister-item-content p .certificate") %>%
  html_text() -> movie_certificate

movie_certificate

## ----extract runtime-----------------------------------------------------
imdb %>%
  html_nodes(".lister-item-content p .runtime") %>%
  html_text() %>%
  str_split(" ") %>%
  map_chr(1) %>%
  as.numeric() -> movie_runtime

movie_runtime

## ----extract genre-------------------------------------------------------
imdb %>%
  html_nodes(".lister-item-content p .genre") %>%
  html_text() %>%
  str_trim() -> movie_genre

movie_genre

## ----extract rating------------------------------------------------------
imdb %>%
  html_nodes(".ratings-bar .ratings-imdb-rating") %>%
  html_attr("data-value") %>% 
  as.numeric() -> movie_rating

movie_rating

## ----extract votes-------------------------------------------------------
imdb %>%
  html_nodes(xpath = '//meta[@itemprop="ratingCount"]') %>% 
  html_attr('content') %>% 
  as.numeric() -> movie_votes

movie_votes

## ----extract revenue-----------------------------------------------------
imdb %>%
  html_nodes(xpath = '//span[@name="nv"]') %>%
  html_text() %>%
  str_extract(pattern = "^\\$.*") %>%
  na.omit() %>%
  as.character() %>%
  append(values = NA, after = 30) %>%
  append(values = NA, after = 46) %>%
  str_sub(start = 2, end = nchar(.) - 1) %>%
  as.numeric() -> movie_revenue

movie_revenue

## ----top 50 movie details------------------------------------------------
top_50 <- tibble(title = movie_title, release = movie_year, 
    `runtime (mins)` = movie_runtime, genre = movie_genre, rating = movie_rating, 
    votes = movie_votes, `revenue ($ millions)` = movie_revenue)

top_50

## RBI Governors
## ----check robots.txt----------------------------------------------------
paths_allowed(
  paths = c("https://en.wikipedia.org/wiki/List_of_Governors_of_Reserve_Bank_of_India")
)

## ----read html-----------------------------------------------------------
rbi_guv <- read_html("https://en.wikipedia.org/wiki/List_of_Governors_of_Reserve_Bank_of_India")
rbi_guv

## ----extract profile-----------------------------------------------------
rbi_guv %>%
  html_nodes("table") %>%
  html_table() %>%
  extract2(2) -> profile

profile

## ----sort by term length-------------------------------------------------
profile %>%
  separate(`Term in office`, into = c("term", "days")) %>%
  select(Officeholder, term) %>%
  arrange(desc(as.numeric(term)))

## ----background----------------------------------------------------------
profile %>%
  count(Background) 

## ----combine categories--------------------------------------------------
profile %>%
  pull(Background) %>%
  fct_collapse(
    Bureaucrats = c("IAS officer", "ICS officer",
    "Indian Administrative Service (IAS) officer",
    "Indian Audit and Accounts Service officer",
    "Indian Civil Service (ICS) officer"),
    `No Info` = c(""),
    `RBI Officer` = c("Career Reserve Bank of India officer")
  ) %>%
  fct_count() %>%
  rename(background = f, count = n) -> backgrounds

## ----backgrounds---------------------------------------------------------
backgrounds

## ----plot backgrounds----------------------------------------------------
backgrounds %>%
  ggplot() +
  geom_col(aes(background, count), fill = "blue") +
  xlab("Background") + ylab("Count") +
  ggtitle("Background of RBI Governors")

