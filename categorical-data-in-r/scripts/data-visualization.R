## ----load packages-------------------------------------
library(magrittr)
library(forcats)
library(readr)
library(dplyr)
library(tibble)
library(ggplot2)
library(ggmosaic)
library(ggpubr)
library(plotrix)


## ----import data---------------------------------------
data <- readRDS('analytics.rds')


## ----bar plot------------------------------------------
ggplot(data) +
  geom_bar(aes(x = device), fill = "blue") +
  xlab("Device") + ylab("Count")


## ----grouped bar plot----------------------------------
ggplot(data) +
  geom_bar(aes(x = device, fill = gender), position = "dodge") +
  xlab("Device") + ylab("Count")


## ----stacked bar plot----------------------------------
ggplot(data) +
  geom_bar(aes(x = device, fill = gender)) +
  xlab("Device") + ylab("Count")


## ----proportional bar plot-----------------------------
data %>% 
  select(device, gender) %>% 
  table() %>% 
  tibble::as_tibble() %>% 
  ggplot(aes(x = device, y = n, fill = gender)) +
  geom_bar(stat = "identity", position = "fill") +
  xlab("Device") + ylab("Gender")


## ----mosaic plot---------------------------------------
ggplot(data = data) +
  geom_mosaic(aes(x = product(channel, device), fill = channel)) +
  xlab("Device") + ylab("Channel")


## ----base R pie chart-----------------------------------
data %>% 
  pull(device) %>% 
  table() %>% 
  pie()


## ----3D pie chart--------------------------------------
data %>% 
  pull(device) %>% 
  table() %>% 
  pie3D(explode = 0.1)


## ----ggplot2 pie chart---------------------------------
data %>% 
  pull(device) %>% 
  fct_count() %>% 
  rename(device = f, count = n) %>% 
  ggplot() +
  geom_bar(aes(x = "", y = count, fill = device), width = 1, stat = "identity") +
  coord_polar("y", start = 0)


## ----donut chart---------------------------------------
data %>% 
  pull(device) %>% 
  fct_count() %>% 
  rename(device = f, count = n) %>% 
  ggdonutchart("count", label = "device", fill = "device", color = "white",
               palette = c("#00AFBB", "#E7B800", "#FC4E07"))


