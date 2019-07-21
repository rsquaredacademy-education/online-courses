## ---- libraries----------------------------------------------------------
library(rfm)
library(magrittr)
library(dplyr)
library(lubridate)

## ----transaction data----------------------------------------------------
rfm_data_orders

## ----rfm table-----------------------------------------------------------
analysis_date <- lubridate::as_date("2006-12-31", tz = "UTC")
rfm_result    <- rfm_table_order(rfm_data_orders, customer_id, order_date, revenue, analysis_date)
rfm_result 

## ----segments------------------------------------------------------------
segment_names <- c("Champions", "Loyal Customers", "Potential Loyalist",
  "New Customers", "Promising", "Need Attention", "About To Sleep",
  "At Risk", "Can't Lose Them", "Hibernating", "Lost")

recency_lower   <- c(4, 2, 3, 4, 3, 3, 2, 1, 1, 2, 1)
recency_upper   <- c(5, 4, 5, 5, 4, 4, 3, 2, 1, 3, 1)
frequency_lower <- c(4, 3, 1, 1, 1, 3, 1, 2, 4, 2, 1)
frequency_upper <- c(5, 4, 3, 1, 1, 4, 2, 5, 5, 3, 1)
monetary_lower  <- c(4, 4, 1, 1, 1, 3, 1, 2, 4, 2, 1)
monetary_upper  <- c(5, 5, 3, 1, 1, 4, 2, 5, 5, 3, 1)

segments <- rfm_segment(rfm_result, segment_names, recency_lower, recency_upper,
frequency_lower, frequency_upper, monetary_lower, monetary_upper)

segments

## ----tabulate segments---------------------------------------------------
segments %>%
  dplyr::count(segment) %>%
  dplyr::arrange(dplyr::desc(n)) %>%
  dplyr::rename(Segment = segment, Count = n)

## ----average recency-----------------------------------------------------
rfm_plot_median_recency(segments)

## ----average frequency---------------------------------------------------
rfm_plot_median_frequency(segments)

## ----average monetary value----------------------------------------------
rfm_plot_median_monetary(segments)

## ----heatmap-------------------------------------------------------------
rfm_heatmap(rfm_result)

## ----barchart------------------------------------------------------------
rfm_bar_chart(rfm_result)

## ----histogram-----------------------------------------------------------
rfm_histograms(rfm_result)

## ----customers by orders-------------------------------------------------
rfm_order_dist(rfm_result)

## ----recency vs monetary value-------------------------------------------
rfm_rm_plot(rfm_result)

## ----frequency vs monetary value-----------------------------------------
rfm_fm_plot(rfm_result)

## ----recency vs frequency------------------------------------------------ 
rfm_rf_plot(rfm_result)

## ----launch shiny web app------------------------------------------------
rfm_launch_app()