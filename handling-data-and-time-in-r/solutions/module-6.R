# load package
library(lubridate)

# parse date
# July-05-19
strptime("July-05-19",   format = "%B-%d-%y")
parse_date("July-05-19", format = "%B-%d-%y")
mdy("July-05-19")

# JUL-05-19
strptime("JUL-05-19",   format = "%b-%d-%y")
parse_date("JUL-05-19", format = "%b-%d-%y")
mdy("JUL-05-19")

# 05.07.19
strptime("05.07.19",   format = "%d.%m.%y")
parse_date("05.07.19", format = "%d.%m.%y")
dmy("05.07.19")

# 5-July, 2019
strptime("5-July, 2019",   format = "%d-%B, %Y")
parse_date("5-July, 2019", format = "%d-%B, %Y")
dmy("5-July, 2019")

# July 5th, 2019
strptime("July 5th, 2019",   format = "%B %dth, %Y")
parse_date("July 5th, 2019", format = "%B %dth, %Y")
mdy("July 5th, 2019")

# July 05, 2019
strptime("July 05, 2019",  format = "%B %d, %Y")
parse_date("July 05, 2019",  format = "%B %d, %Y")
mdy("July 05, 2019")

# 2019-July-05
strptime("2019-July-05",   format = "%Y-%B-%d")
parse_date("2019-July-05",   format = "%Y-%B-%d")
ymd("2019-July-05")

# 05/07/2019
strptime("05/07/2019",     format = "%d/%m/%Y")
parse_date("05/07/2019",     format = "%d/%m/%Y")
dmy("05/07/2019")

# 07/05/2019
strptime("07/05/2019",     format = "%m/%d/%Y")
parse_date("07/05/2019",     format = "%m/%d/%Y")
mdy("07/05/2019")

# 7/5/2019
strptime("7/5/2019",       format = "%m/%d/%Y")
parse_date("7/5/2019",       format = "%m/%d/%Y")
mdy("7/5/2019")

# 07/5/19
strptime("07/5/19",        format = "%m/%d/%y")
parse_date("07/5/19",        format = "%m/%d/%y")
mdy("07/5/19")

# 2019-07-05
strptime("2019-07-05",    format = "%Y-%m-%d")
parse_date("2019-07-05",    format = "%Y-%m-%d")
ymd("2019-07-05")
