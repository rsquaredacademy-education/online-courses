# install.packages("tibble")
# install.packages("tidyverse")
library(tibble)

tibble(x = letters,
       y = 1:26,
       z = sample(100, 26))

df <- data.frame(x = letters,
       y = 1:26,
       z = sample(100, 26))
str(df)

# column names
names(data.frame(`order value` = 10))
names(tibble(`order value` = 10))


x <- 1:100
y <- TRUE
data.frame(x, y)
tibble(x, y)

# enframe
browsers <- c("chrome", "safari", "firefox", "edge")
enframe(browsers)

browsers <- c(chrome = 40, firefox = 20, edge = 30, safari = 10)
enframe(browsers)

# manipulate tibble
browsers <- enframe(c(chrome = 40, firefox = 20, edge = 30))
add_row(browsers, name = 'safari', value = 10)
add_row(browsers, name = 'safari', value = 10, .before = 2)
add_column(browsers, visits = c(4000, 2000, 3000))

# glimpse
glimpse(mtcars)

# membership testing
is_tibble(mtcars)

# check column names
has_name(mtcars, 'cyl')
has_name(mtcars, 'cyls')



