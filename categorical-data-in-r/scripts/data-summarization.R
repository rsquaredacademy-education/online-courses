## ----load packages-------------------------------------
library(forcats)
library(dplyr)
library(gmodels)
library(descriptr)


## ----import data---------------------------------------
data <- readRDS('analytics.rds')


## ----number of categories------------------------------
nlevels(data$device)


## ----display categories--------------------------------
levels(data$device)


## ----unique values-------------------------------------
unique(data$device)
fct_unique(data$device)


## ----tabulate------------------------------------------
table(data$device)
fct_count(data$device)
summary(data$device)


## ----store table---------------------------------------
tab <- table(data$device)
tab


## ----display proportions instead of counts-------------
prop.table(tab)
proportions(tab)


## ----display percentage instead of count---------------
proportions(tab) * 100
round(proportions(tab) * 100, 2)


## ----cross table---------------------------------------
tab2 <- table(data$gender, data$device)
tab2


## ----order of variable matters-------------------------
table(data$device, data$gender)


## ----display proportion instead of count--------------
proportions(tab2)
proportions(tab2) * 100


## ----marginal frequencies------------------------------
margin.table(tab2, 1) # sum of rows
margin.table(tab2, 2) # sum of columns


## ----sum of all cells of the table---------------------
margin.table(tab2)


## ----group labels---------------------------------------
dimnames(tab2)
names(tab2)
names(dimnames(tab2)) 


## ----add row & column labels---------------------------
names(dimnames(tab2)) <- c("Gender", "Device")
tab2


## ----display group, row & column labels----------------
dimnames(tab2)


## ----add margin totals---------------------------------
addmargins(tab2)


## ----row & column totals-------------------------------
rowSums(tab2)
colSums(tab2)


## ----xtabs---------------------------------------------
tabx <- xtabs(~gender+device, data = data)
tabx


## ----proportions, marginal frequencies & margin totals-
proportions(tabx)
margin.table(tabx, 1)
margin.table(tabx, 2)
addmargins(tabx)


## ----multi-dimensional table---------------------------
tab3 <- xtabs(~gender+device+channel, data = data)
tab3


## ----flat tables---------------------------------------
ftable(tabx)
ftable(tab2)
ftable(tab3)


## ----missing values------------------------------------
gen <- as.factor(as.character(data$gender))
table(gen)
table(gen, useNA = "ifany")
table(data$device, useNA = "always")


## ----select/access table elements----------------------
tab2[1, ]           
tab2[, 1]           
tab2[1:2, ]         
tab2[, 1:2]        
tab2[2, ]          
tab2[, 2]          
tab2["female", ]   
tab2[, "Mobile"]   

## ---- membership testing-------------------------------
is.table(tab2)


## ----sas/spss style cross tables ----------------------
gmodels::CrossTable(data$device, data$gender)
descriptr::ds_cross_table(data, device, gender)


## ----summarization functions from different packages---
Hmisc::describe(data$device)
janitor::tabyl(data$device)
epiDisplay::tab1(data$device)
summarytools::freq(data$device)
questionr::freq(data$device)
descriptr::ds_freq_table(data, device)


## ----summarization functions from different packages---
minilytics <- select(data, device, browser, os)
psych::describe(minilytics)
skimr::skim(minilytics)
summarytools::dfSummary(minilytics)
tableone::CreateTableOne(vars = c("device", "os"), data = minilytics)
desctable::desctable(minilytics)

