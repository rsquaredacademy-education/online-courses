## ----load packages-------------------------------------
library(forcats)


## ----read data-----------------------------------------
data <- readRDS('analytics.rds')


## ----channel column------------------------------------
channel <- data$channel


## ----tabulate------------------------------------------
fct_count(channel)


## ----tabulate & sort result----------------------------
fct_count(channel, sort = TRUE)


## ----display proportion instead of count---------------
fct_count(channel, prop = TRUE)


## ----check if levels are valid-------------------------
channel %>%
  fct_match("Social") %>%
  table()


## ----combine paid & organic search---------------------
channel %>% 
  fct_collapse(Search = c("Paid Search", "Organic Search")) %>% 
  fct_count()


## ----use fct_recode instead of fct_collapse------------
channel %>% 
  fct_recode(
    Search = "Paid Search",
    Search = "Organic Search"
  ) %>% 
  fct_count()


## ----retain channels that drive a minimun traffic of 5000
channel %>% 
  fct_lump_min(min = 5000) %>% 
  fct_count()


## ----retain top 3 channels-----------------------------
channel %>% 
  fct_lump_n(n = 3) %>% 
  fct_count()


## ----retain channels that drive atleast 2% traffic-----
channel %>% 
  fct_lump_prop(prop = 0.02) %>% 
  fct_count()


## ----retain specific channels--------------------------
# channels to be retained 
retain <- c("Organic Search", "Direct", "Referral")

channel %>% 
  fct_other(keep = retain) %>% #<<
  fct_count()


## ----drop specific channels----------------------------
# channels to be dropped
dropped <- c("Display", "Paid Search")

channel %>% 
  fct_other(drop = dropped) %>% 
  fct_count()


## ----compare functions---------------------------------
# collapse
channel %>% 
  fct_collapse(Other = c("(Other)",     
                         "Affiliates",  
                         "Display",      
                         "Paid Search", 
                         "Social")) %>% 
  fct_count()

# recode
channel %>% 
  fct_recode(Other = "(Other)",     
             Other = "Affiliates",  
             Other = "Display",     
             Other = "Paid Search", 
             Other = "Social") %>%  
  fct_count()


## ----anonymize data------------------------------------
channel %>% 
  fct_anon(prefix = "ch_") %>% 
  fct_count()


## ----add new level-------------------------------------
channel %>% 
  fct_expand("Blog") %>% #<<
  levels()


## ----drop unused levels--------------------------------
channel %>% 
  fct_expand("Blog") %>% 
  fct_drop() %>% #<<
  levels()


## ----make missing values explicit----------------------
data %>% 
  use_series(gender) %>% 
  fct_explicit_na() %>%  #<<
  fct_count()


## ----make Organic Search the first level---------------
levels(channel)

channel %>% 
  fct_relevel("Organic Search") %>% #<<
  levels()


## ----make Referral the third level---------------------
levels(channel)

channel %>% 
  fct_relevel("Referral", after = 2) %>% #<<
  levels()


## ----make Display the last level-----------------------
levels(channel)

channel %>% 
  fct_relevel("Display", after = Inf) %>% #<<
  levels()


## ---- reorder levels-----------------------------------

# order levels by frequency
channel %>% 
  fct_infreq() %>% #<<
  levels()

# order levels in order of appearance
channel %>% 
  fct_inorder() %>% #<<
  levels()

# reverse order of levels
channel %>% 
  fct_rev() %>% #<<
  levels()

# randomly shuffle order of levels
channel %>% 
  fct_shuffle() %>% #<<
  levels()

