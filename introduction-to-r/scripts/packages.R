## ----install0, echo=FALSE------------------------------------------------
library('kableExtra')

## ----install1, eval=FALSE------------------------------------------------
## install.packages('ggplot2')

## ----install2, eval=FALSE------------------------------------------------
## devtools::install_github("tidyverse/ggplot2")
## remotes::install_github("tidyverse/dplyr")

## ----install3, eval=FALSE------------------------------------------------
## devtools::install_bitbucket("dannavarro/lsr-package")
## remotes::install_bitbucket("dannavarro/lsr-package")

## ----install4, eval=FALSE------------------------------------------------
## install_bioc("SummarizedExperiment")

## ----install6, eval=FALSE------------------------------------------------
## install.packages('quantstrat', repos = 'https://r-forge.r-project.org/')

## ----install7, eval=FALSE------------------------------------------------
## remotes::install_version('dplyr', version = 0.5.0)

## ----install8, eval=FALSE------------------------------------------------
## remotes::install_github('tidyverse/dplyr@*release')

## ----install14, echo=FALSE, messages=FALSE-------------------------------
text_tbl <- data.frame(
  Function = c("`installed.packages()`", "`library('package_name')`", "`available.packages()`",
  "`old.packages()`", "`new.packages()`", "`update.packages()`", "`remove.packages('package_name')`"),
  Descritpion = c(
    "View currently installed packages. ",
    "Load package into the current R session. ",
    "List of packages available for installation. ",
    "List of packages which have new versions available. ",
    "List of packages already not installed. ",
    "Update packages which have new versions available. ",
    "Remove installed packages. "
  )
)

kable(text_tbl, format = "html") %>%
  kable_styling(full_width = F) %>%
  column_spec(1, bold = FALSE, border_right = T) %>%
  column_spec(2, width = "30em")

## ----install9------------------------------------------------------------
.libPaths()

## ----install11, eval=FALSE-----------------------------------------------
## library(lubridate, lib.loc = "C:/Program Files/R/R-3.4.1/library")

