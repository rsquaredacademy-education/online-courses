## ----libs----------------------------------------------------------------
# install.packages("devtools")
install_github("rsquaredacademy/mbar")
library(readxl)
library(readr)
library(mbar)
library(arules)
library(arulesViz)
library(magrittr)
library(dplyr)
library(lubridate)
library(forcats)
library(ggplot2)

## ----preprocess----------------------------------------------------------
mba_data <- read_excel("online-retail.xlsx")
transactions <- mbar_prep_data(mba_data, InvoiceNo, Description)
head(transactions)

## ----what time of day do people purchase?--------------------------------
purchase_time <-
  mba_data %>%
  group_by(InvoiceDate) %>%
  slice(1) %>%
  mutate(time_of_day = hour(InvoiceDate)) %>%
  pull(time_of_day) %>%
  as.factor() %>%
  fct_count()

## plot
purchase_time %>%
  ggplot() +
  geom_col(aes(x = f, y = n), fill = "blue") +
  xlab("Hour of Day") + ylab("Transactions") +
  ggtitle("Hourly Transaction Distribution")  

## ----how many items are purchased on an average--------------------------
items <- 
  mba_data %>%
  group_by(InvoiceNo) %>%
  summarize(count = n()) %>%
  pull(count) 

mean(items)
median(items)

## ----most purchased items------------------------------------------------
mba_data %>%
  group_by(Description) %>%
  summarize(count = n()) %>%
  arrange(desc(count))

## ----average order value-------------------------------------------------
total_revenue <- 
  mba_data %>%
  group_by(InvoiceNo) %>%
  summarize(order_sum = sum(UnitPrice)) %>%
  pull(order_sum) %>%
  sum()

total_transactions <- 
  mba_data %>%
  group_by(InvoiceNo) %>%
  summarize(n()) %>%
  nrow()

total_revenue / total_transactions

## ----read_data-----------------------------------------------------------
basket_data <- read.transactions("transaction_data.csv", format = "basket", 
  sep = ",")
basket_data

## ----format = single-----------------------------------------------------
get_data <- read.transactions("retail.csv", 
  format = "single",
  sep = ",",
  cols = c("InvoiceNo", "item"))

## ----summary-------------------------------------------------------------
summary(basket_data)

## ----item frequency plot-------------------------------------------------
itemFrequencyPlot(basket_data, topN = 10, type = 'absolute')

## ----generate rules------------------------------------------------------
rules <- apriori(basket_data, parameter = list(supp=0.009, conf=0.8, 
	target = "rules", maxlen = 4))

## ----rules summary-------------------------------------------------------
summary(rules)

## ----inspect rules-------------------------------------------------------
basket_rules <- sort(rules, by = 'confidence', decreasing = TRUE)
inspect(basket_rules[1:10])

## ----redundant rules-----------------------------------------------------
inspect(rules[is.redundant(rules)])

## ----non redundant rules-------------------------------------------------
inspect(rules[!is.redundant(rules)])

## ----what influenced purchase of sugar-----------------------------------
sugar_rules <- apriori(basket_data, parameter = list(supp = 0.009, conf = 0.8), 
  appearance = list(default = "lhs", rhs = "SUGAR")) 
rules_sugar <- sort(sugar_rules, by = "confidence", decreasing = TRUE)
inspect(rules_sugar)

## ----what purchases did sugar influence----------------------------------
sugar_rules <- apriori(basket_data, parameter = list(supp = 0.009, conf = 0.8), 
  appearance = list(default = "rhs", lhs = "SUGAR")) 
rules_sugar <- sort(sugar_rules, by = "confidence", decreasing = TRUE)
inspect(rules_sugar)

## ----top rules by support------------------------------------------------
supp_rules <- sort(rules, by = 'support', decreasing = TRUE)
top_rules <- supp_rules[1:10]
inspect(top_rules)

## ----top rules by confidence---------------------------------------------
supp_rules <- sort(rules, by = 'confidence', decreasing = TRUE)
top_rules <- supp_rules[1:10]
inspect(top_rules)

## ----top rules by lift---------------------------------------------------
supp_rules <- sort(rules, by = 'lift', decreasing = TRUE)
top_rules <- supp_rules[1:10]
inspect(top_rules)

## ----plot rules----------------------------------------------------------
plot(basket_rules)

## ----plot rules----------------------------------------------------------
plot(top_rules, method = 'graph')

