## ----load packages-------------------------------------
library(forcats)


## ----import data---------------------------------------
data <- readRDS('analytics.rds')


## ----sample data---------------------------------------
device <- sample(c("Desktop", "Mobile", "Tablet"), size = 25, replace = TRUE)
device


## ----membership testing--------------------------------
is.factor(device)


## ----coercion------------------------------------------
as.factor(device)
as_factor(device)


## ----factor function-----------------------------------
factor(device)


## ----specify levels------------------------------------
factor(device, levels = c("Desktop", "Mobile", "Tablet"))
factor(device, levels = c("Desktop", "Mobile"))


## ----modify labels-------------------------------------
factor(device, 
       levels = c("Desktop", "Mobile", "Tablet"),
       labels = c("Desk", "Mob", "Tab"))


## ----sample data with missing values-------------------
# sample with missing values
device <- sample(c("Desktop", "Mobile", "Tablet", NA), size = 25, replace = TRUE)
device

# store as categorical data
factor(device)


## ----treat NA as a level-------------------------------
factor(device, exclude = NULL)


## ----satisfaction rating sample data-------------------
rating <- sample(c("Dislike", "Neutral", "Like"), size = 25, replace = TRUE)
rating


## ----membership testing--------------------------------
is.ordered(rating)


## ----coercion------------------------------------------
as.ordered(rating)


## ----ordered factor------------------------------------
factor(rating, ordered = TRUE)


## ----modify order of levels----------------------------
factor(rating, levels = c("Dislike", "Neutral", "Like"), ordered = TRUE)


## ----ordered function----------------------------------
ordered(rating, levels = c("Dislike", "Neutral", "Like"))