# load libraries
library(forcats)
library(magrittr)

# read data
analytics <- readRDS("analytics.rds")

# display count in descending order
fct_count(analytics$landing_page, sort = TRUE)
fct_count(analytics$exit_page, sort = TRUE)

# check if `laptop` is a level in the `device` column.
fct_match(analytics$device, 'laptop')

# 3. Combine the following levels in `landing_page` into `Account`
#
#    - `My Account`
#    - `Register`
#    - `Sign In`
#    - `Your Info`
#
fct_collapse(analytics$landing_page,
                      Account = c("My Account", "Register", 
                                  "Sign In", "Your Info"))

fct_recode(analytics$landing_page,
                    Account = "My Account",
                    Account = "Register",
                    Account = "Sign In",
                    Account = "Your Info")

# 4. Combine levels in `landing_page` that drive less than 1000 visits.
fct_lump_min(analytics$landing_page, 1000)

# 5. Get top 10 landing and exit pages.
fct_lump_n(analytics$landing_page, 10)
fct_lump_n(analytics$exit_page, 10)

# 6. Get landing pages that drive at least 5% of the total traffic to the website.
fct_lump_prop(analytics$landing_page, 0.05)

# 7. Retain only the following levels in the `browser` column:
#
#    - `Chrome`
#    - `Firefox`
#    - `Safari`
#    - `Edge`
#    
fct_other(analytics$browser, keep = c("Chrome", "Firefox", "Safari", "Edge"))

# 8. Anonymize landing and exit page levels.
fct_anon(analytics$landing_page, prefix = "lp_")
fct_anon(analytics$landing_page, prefix = "ep_")

# 9. Make `Home` first level in the `landing_page` column.
fct_relevel(analytics$landing_page, "Home")

# 10. Make `Apparel` second level in the `landing_page` column.
fct_relevel(analytics$landing_page, "Apparel", after = 1)

# 11. Make `Specials` last level in the `landing_page` column. 
fct_relevel(analytics$landing_page, "Specials", after = Inf)

# 12. Order the levels in the browser by frequency:  
fct_infreq(analytics$browser)

# 13. Order the levels in landing page by appearance:
fct_inorder(analytics$landing_page)

# 14. Shuffle the levels in os
fct_shuffle(analytics$os)

# 15. Reverse the levels in browser
fct_reverse(analytics$browser)