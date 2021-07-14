## ----load libraries--------------
library(ggplot2)
library(dplyr)
library(tibble)
library(ggmosaic)
library(ggpubr)
library(plotrix)
library(magrittr)
library(forcats)

## read data
data <- readRDS("analytics.rds")

## Bar plot of `channel` 
ggplot(data) +
  geom_bar(aes(x = channel), fill = "blue") +
    ggtitle("Source of Traffic") +
    xlab("Channel") + ylab("Count")


## Grouped bar plot of `user_type` by `channel`
ggplot(data) +
  geom_bar(aes(x = channel, fill = user_type), position = "dodge") +
    ggtitle("User Type by Channel") +
    xlab("Channel") + ylab("User Type")


## Stacked bar plot of `channel` by `gender`
ggplot(data) +
  geom_bar(aes(x = gender, fill = channel)) +
    ggtitle("Channel by Gender") +
    xlab("Gender") + ylab("Channel")


## Proportional bar plot of `channel` by `device`
data %>% 
  select(device, channel) %>% 
  table() %>% 
  tibble::as_tibble() %>% 
  ggplot(aes(x = device, y = n, fill = channel)) +
  geom_bar(stat = "identity", position = "fill") +
  ggtitle("Channel by Device") +
  xlab("Device") + ylab("Channel")


## Mosaic plot of `device` by `channel`
ggplot(data) +
  geom_mosaic(aes(x = product(device, channel), fill = device)) +
    ggtitle("Device by Channel") +
    xlab("Channel") + ylab("Device")


## Pie Chart
data %>% 
  pull(channel) %>% 
  table() %>% 
  pie()


## 3D Pie Chart
data %>% 
  pull(channel) %>% 
  table() %>% 
  pie3D(explode = 0.1)


## Pie Chart (ggplot2)
data %>% 
  pull(channel) %>% 
  fct_count() %>% 
  rename(channel = f, count = n) %>% 
  ggplot() +
  geom_bar(aes(x = "", y = count, fill = channel), 
           width = 1, stat = "identity") +
  coord_polar("y", start = 0)


## Donut Chart
data %>% 
  pull(channel) %>% 
  fct_count() %>% 
  rename(channel = f, count = n) %>% 
  ggdonutchart("count", label = "channel", fill = "channel", color = "white")

