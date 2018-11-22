#! /usr/bin/env Rscript 
# 03_anova.R
# Hayley Boyce, Nov 2018
# Simon Chiu
#
# This script takes the clean dataset in the data directory and performs ANOVA tests on the `Age.Group` values. 
# 
# This script takes 2 arguments: one taking the raw data and the other names the newly created anova table.
# 
# Usage: Rscript 03_anova.R

library(tidyverse)
# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
out <- args[2]
# define main function
main <- function(){
  
  # read in data
  clean_unemployment <- read.csv(input_file)
  
  #makes new variables for the age groups
  young <- clean_unemployment %>% filter (Age.Group == "15-24")
  med <- clean_unemployment %>% filter (Age.Group == "25-54")
  old <- clean_unemployment %>% filter (Age.Group == "55-64")

  #using tidy and aov   
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


