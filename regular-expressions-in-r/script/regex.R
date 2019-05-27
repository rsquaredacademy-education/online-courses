## ----libraries-----------------------------------------------------------
library(dplyr)
library(readr)

## ----read data-----------------------------------------------------------
read_csv("data/package_names.csv") %>%
  pull(1) -> r_packages 
r_packages

## ----top downloads-------------------------------------------------------
top_downloads <- c("devtools", "rlang", "dplyr", "Rcpp", "tibble",    
                   "ggplot2", "glue", "pillar", "cli", "data.table")
top_downloads

## ----grep----------------------------------------------------------------
grep(x = top_downloads, pattern = "r")

## ----grep value----------------------------------------------------------
grep(x = top_downloads, pattern = "r", value = TRUE)

## ----grep ignore case----------------------------------------------------
grep(x = top_downloads, pattern = "r", value = TRUE, ignore.case = TRUE)
grep(x = top_downloads, pattern = "R", value = TRUE)
grep(x = top_downloads, pattern = "R", value = TRUE, ignore.case = TRUE)

## ----grep invert---------------------------------------------------------
grep(x = top_downloads, pattern = "r", value = TRUE, invert = TRUE)
grep(x = top_downloads, pattern = "r", value = TRUE, 
     invert = TRUE, ignore.case = TRUE)

## ----grepl---------------------------------------------------------------
grepl(x = top_downloads, pattern = "r")

## ----grepl ignore case---------------------------------------------------
grepl(x = top_downloads, pattern = "r", ignore.case = TRUE)

## ----regexpr-------------------------------------------------------------
rr_pkgs <- c("purrr", "olsrr", "blorr")
regexpr("r", rr_pkgs)

## ----gregexpr------------------------------------------------------------
gregexpr("r", rr_pkgs)

## ----regexec-------------------------------------------------------------
regexec("r", rr_pkgs)

## ----sub-----------------------------------------------------------------
rr_pkgs <- c("purrr", "olsrr", "blorr")
sub(x = rr_pkgs, pattern = "r", replacement = "s")

## ----gsub----------------------------------------------------------------
gsub(x = rr_pkgs, pattern = "r", replacement = "s")

## ----anchor ^------------------------------------------------------------
grep(x = top_downloads, pattern = "^r", value = TRUE)

## ----anchor ^ ignore case------------------------------------------------
grep(x = top_downloads, pattern = "^r", value = TRUE, ignore.case = TRUE)

## ----anchor $------------------------------------------------------------
grep(x = top_downloads, pattern = "r$", value = TRUE)

## ----meta characters-----------------------------------------------------
grep(x = r_packages, pattern = ".", value = TRUE)[1:60]
grep(x = r_packages, pattern = "\\.", value = TRUE)[1:50]

## ----quantifier dot------------------------------------------------------
data_pkgs <- grep(x = r_packages, pattern = "data", value = TRUE)
grep(x = data_pkgs, pattern = "data.r", value = TRUE, ignore.case = TRUE)
grep(x = data_pkgs, pattern = "data...r", value = TRUE, ignore.case = TRUE)
grep(x = r_packages, pattern = "data(.){3}r", value = TRUE, ignore.case = TRUE)
grep(x = r_packages, pattern = "stat..r", value = TRUE, ignore.case = TRUE)

## ----quantifier question-------------------------------------------------
grep(x = data_pkgs, pattern = "r(.)?data", value = TRUE)
grep(x = data_pkgs, pattern = "r(\\.)?data", value = TRUE)
grep(x = data_pkgs, pattern = "r(m|y|q)?data", value = TRUE)
grep(x = data_pkgs, pattern = "r(\\.|m|y|q)?data", value = TRUE)

## ----quantifier star-----------------------------------------------------
grep(x = data_pkgs, pattern = "r(.)*data", value = TRUE)

## ----quantifier plus-----------------------------------------------------
plot_pkgs <- grep(x = r_packages, pattern = "plot", value = TRUE)
grep(x = plot_pkgs, pattern = "(g)+plot", value = TRUE, ignore.case = TRUE)

## ----quantifier {n}------------------------------------------------------
grep(x = plot_pkgs, pattern = "(g){2}plot", value = TRUE)

## ----quantifier_{1,}-----------------------------------------------------
grep(x = plot_pkgs, pattern = "(g){1, }plot", value = TRUE)

## ----quantifier {m,n}----------------------------------------------------
grep(x = plot_pkgs, pattern = "(t){1,3}plot", value = TRUE)

## ----or------------------------------------------------------------------
grep(x = top_downloads, pattern = "g(g|l)", value = TRUE)
grep(x = top_downloads, pattern = "d[epa]", value = TRUE)

## ----digit---------------------------------------------------------------
grep(x = r_packages, pattern = "\\d", value = TRUE)

## ----non digit-----------------------------------------------------------
invoice_id <- c("R536365", "R536472", "R536671", "536915", "R536125", "R536287",
                "536741", "R536893", "R536521", "536999")
grep(x = invoice_id, pattern = "\\D", value = TRUE)

## ----space---------------------------------------------------------------
grep(x = c("R536365", "R 536472", "R536671", "R536915", "R53 6125", "R536287",
           "536741", "R5368  93", "R536521", "536 999"), 
     pattern = "\\s", value = TRUE)

## ----non space-----------------------------------------------------------
grep(x = c("R536365", "R 536472", " ", "R536915", "R53 6125", "R536287",
           " ", "R5368  93", "R536521", "536 999"), 
     pattern = "\\S", value = TRUE)

## ----word----------------------------------------------------------------
grep(x = c("R536365", "%+$!#@?", "R536671", "R536915", "$%+#!@?", "R5362@87",
           "53+67$41", "R536893", "@$+%#!", "536#999"), 
     pattern = "\\w", value = TRUE)

## ----non word------------------------------------------------------------
grep(x = c("R536365", "%+$!#@?", "R536671", "R536915", "$%+#!@?", "R5362@87",
           "53+67$41", "R536893", "@$+%#!", "536#999"), 
     pattern = "\\W", value = TRUE)

## ----boundary code-------------------------------------------------------
grep(x = r_packages, pattern = "\\bstat", value = TRUE) 
grep(x = r_packages, pattern = "stat\\b", value = TRUE)
grep(x = r_packages, pattern = "\\Bstat", value = TRUE)
grep(x = r_packages, pattern = "stat\\B", value = TRUE)
grep(x = r_packages, pattern = "\\Bstat\\B", value = TRUE)

## ----character code------------------------------------------------------
grep(x = top_downloads, pattern = "[aeiou]", value = TRUE)
grep(x = r_packages, pattern = "[0-9]", value = TRUE)
grep(x = r_packages, pattern = "^[0-9]", value = TRUE)
grep(x = r_packages, pattern = "[0-9]$", value = TRUE)
grep(x = r_packages, pattern = "^[A-Z][A-Z]{1, }[A-Z]$", value = TRUE)

## ----case studies--------------------------------------------------------
## ----blood group---------------------------------------------------------
blood_pattern <- "^(A|B|AB|O)[-|+]$"
blood_sample <- c("A+", "C-", "AB+")
grep(x = blood_sample, pattern = blood_pattern, value = TRUE)

## ----email validation----------------------------------------------------
email_pattern <- "^[a-zA-Z0-9\\!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\\.[a-z]"
emails <- c("test9+_A@test.com", "test@test..com", "test-test.com")
grep(x = emails, pattern = email_pattern, value = TRUE)

## ----pan validation------------------------------------------------------
pan_pattern <- "^[A-Z]{3}(A|B|C|F|G|H|L|J|P|T|E)[A-Z][0-9]{4}[A-Z]"
my_pan <- c("AJKHT3865H", "AJKNT38655", "A2KNT3865H", "AJKDT3865H")
grep(x = my_pan, pattern = pan_pattern, value = TRUE)

## ----gst validation------------------------------------------------------
gst_pattern <- "^[0-3][1-5][A-Z]{3}(A|B|C|F|G|H|L|J|P|T|E)[A-Z][0-9]{4}[A-Z][1-9]Z[0-9A-Z]"
sample_gst <- c("22AAAAA0000A1Z5", "22AAAAA0000A1Z", "42AAAAA0000A1Z5",
                "38AAAAA0000A1Z5", "22AAAAA0000A0Z5", "22AAAAA0000A1X5",
                "22AAAAA0000A1Z$")
grep(x = sample_gst, pattern = gst_pattern, value = TRUE)

