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
table(fct_match(channel, "Social"))


## ----combine paid & organic search---------------------
fct_count(
  fct_collapse(
    channel,
    Search = c("Paid Search", "Organic Search")
  )
)


## ----use fct_recode instead of fct_collapse------------
fct_count(
  fct_recode(
    channel,
    Search = "Paid Search",
    Search = "Organic Search"
  )
)


## ----retain channels that drive a minimun traffic of 5000
fct_count(fct_lump_min(channel, 5000))


## ----retain top 3 channels-----------------------------
fct_count(fct_lump_n(channel, 3))


## ----retain channels that drive atleast 2% traffic-----
fct_count(fct_lump_prop(channel, 0.02))


## ----retain specific channels--------------------------
fct_count(
  fct_other(
    channel, 
    keep = c("Organic Search", "Direct", "Referral"))
)


## ----drop specific channels----------------------------
fct_count(
  fct_other(
    channel, 
    drop = c("Display", "Paid Search")
  )
)


## ----compare functions---------------------------------
# collapse
fct_count(
  fct_collapse(
  channel,
  Other = c("(Other)", "Affiliates", "Display", "Paid Search", "Social")
  )
)

# recode
fct_count(
  fct_recode(
  channel,
  Other = "(Other)", 
  Other = "Affiliates", 
  Other = "Display", 
  Other = "Paid Search", 
  Other = "Social"
  )
)


## ----anonymize data------------------------------------
fct_count(fct_anon(channel, prefix = "ch_"))


## ----add new level-------------------------------------
levels(fct_expand(channel, "Blog"))


## ----drop unused levels--------------------------------
levels(fct_drop(fct_expand(channel, "Blog")))


## ----make missing values explicit----------------------
fct_count(fct_explicit_na(data$gender))


## ----make Organic Search the first level---------------
levels(channel)
levels(fct_relevel(channel, "Organic Search"))


## ----make Referral the third level---------------------
levels(channel)
levels(fct_relevel(channel, "Referral", after = 2))


## ----make Display the last level-----------------------
levels(channel)
levels(fct_relevel(channel, "Display", after = Inf))


## ---- reorder levels-----------------------------------
# order levels by frequency
levels(channel)
levels(fct_infreq(channel))


# order levels in order of appearance
levels(channel)
levels(fct_inorder(channel))


# reverse order of levels
levels(channel)
levels(fct_rev(channel))


# randomly shuffle order of levels
levels(channel)
levels(fct_shuffle(channel))


