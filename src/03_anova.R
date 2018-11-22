#! /usr/bin/env Rscript 
# clean_data.R
# Hayley Boyce, Nov 2018
# Simon Chiu
#
# This script takes the dataset in the data directory and will clean  and filter it. 
# 
# This script takes 2 arguments: one taking the raw data and the  other naming  the newly created CSV
# 
# Usage: Rscript clean_data.R
library(tidyverse)
# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
out <- args[2]
# define main function
main <- function(){
  
  # read in data
  clean_unemployment <- read.csv(input_file)
  # cleaned to combine Male and Female and filtered out the unnecessary columns
  young <- clean_unemployment %>% filter (Age.Group == "15-24")
  med <- clean_unemployment %>% filter (Age.Group == "25-54")
  old <- clean_unemployment %>% filter (Age.Group == "55-64")
  
  model  <- broom::tidy(aov(Value ~ Age.Group, data=clean_unemployment))
  model
  age_aov_p <-  model$p.value[1]
  age_aov_F <- model$statistic[1]
  age_aov_df  <- model$df
  cat("p-value:\n")
  print(age_aov_p)
  cat("\nDegrees of freedom:\n")
  print(age_aov_df)
  cat("\nTest statistic:\n")
  print(age_aov_F)
  #Write new CSV
  write.csv(model, out)
}
# call main function
main()


