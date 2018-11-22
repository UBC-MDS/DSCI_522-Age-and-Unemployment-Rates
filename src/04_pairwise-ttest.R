#! /usr/bin/env Rscript 
# 04_pairwise-ttest.R
# Hayley Boyce
# Simon Chiu
# November 22, 2018
#
# PURPOSE: This script takes the clean dataset in the data directory and performs 3 pairwise t-tests on the `Age.Group` values to see exactly
# which age groups differs from each other.
# 
# METHOD: This script takes 2 arguments: one taking the clean data (unemployment-age-gender_countries_filtered_clean.csv) file made fromm script 
# 01_clean-data.R and the other names the newly created pairwise t-test table with conclusions if we reject or fail to reject the null hypothesis.
# 
# USAGE: Rscript 04_pairwise-ttest.R
#
# RECOMMENDED:   bash Rscript src/04_pairwise-ttest.R  "data/unemployment-age-gender-countries-filtered-clean.csv" "pairwise-test-table.csv"


library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
out <- args[2]

# define main function
main <- function(){
  
  
  # read in data
  clean_unemployment <- read.csv(input_file)
  
  #the actual calculation of the test statistic and p-value using tidy and pairwise.t.test - Since we are using alternative ="two.sided" 
  #if the p > 0.05 then we fail to reject the null hypothesis that  The mean unemployment rates across the age groups are equal.
  
  pairwise_test <- broom::tidy(pairwise.t.test(x=clean_unemployment$Value, g=clean_unemployment$Age.Group, p.adjust.method = "none", alternative ="two.sided"))
  pairwise_test <- pairwise_test %>% mutate (reject_H0 = if_else(p.value>0.05, FALSE, TRUE))
  pairwise_test
  
  # Write new CSV  
  write.csv(pairwise_test, out)
}
# call main function
main()

