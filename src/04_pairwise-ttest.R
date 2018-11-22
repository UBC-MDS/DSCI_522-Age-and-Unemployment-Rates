#! /usr/bin/env Rscript 
# 04_pairwise-ttest.R
# Hayley Boyce, Nov 2018
# Simon Chiu
#
# This script takes the clean dataset in the data directory and performs pairwise t-tests  on the `Age.Group` values to see exactly which age
# groups differs from each other.
# 
# This script takes 2 arguments: one taking the raw data and the other names the newly created pairwise table.
# 
# Usage: Rscript 04_pairwise-ttest.R

library(tidyverse)
# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
out <- args[2]
# define main function
main <- function(){
  
  clean_unemployment <- read.csv(input_file)
  pairwise_test <- broom::tidy(pairwise.t.test(x=clean_unemployment$Value, g=clean_unemployment$Age.Group, p.adjust.method = "none"))
  pairwise_test <- pairwise_test %>% mutate (reject_H0 = if_else(p.value>0.05, FALSE, TRUE))
  pairwise_test
  
  
  write.csv(pairwise_test, out)
}
# call main function
main()

