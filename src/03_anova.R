#! /usr/bin/env Rscript 
# 03_anova.R
# Hayley Boyce
# Simon Chiu
# November 22, 2018
#
# PURPOSE: This script takes the clean dataset in the data directory and performs ANOVA tests on the `Age.Group` values. 
# 
# METHOD: This script takes 2 arguments: one taking the clean data (unemployment-age-gender_countries_filtered_clean.csv) file made fromm script 
# 01_clean-data.R and the other names the newly created ANOVA table.
# 
# USAGE: Rscript 03_anova.R
# 
# RECOMMENDED: bash Rscript src/03_anova.R  "data/unemployment-age-gender_countries_filtered_clean.csv" "results/anova-table.csv"

library(tidyverse)


# Read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
out <- args[2]

# Define main function
main <- function(){
  
  # Read in data
  clean_unemployment <- read.csv(input_file)
  
  # Makes new variables for the age groups
  young <- clean_unemployment %>% filter (Age.Group == "15-24")
  med <- clean_unemployment %>% filter (Age.Group == "25-54")
  old <- clean_unemployment %>% filter (Age.Group == "55-64")

  # This provides an estimate of the  test statistic. Not reported, but still useful. 
 
   var_total  <-var(clean_unemployment$Value)
  var_group  <- (var(young$Value)+var(med$Value) + (var(old$Value)))/3
  my_ratio <- (var_total/var_group)

  
  # the actual calculation of the test statistic and p-value using tidy and aov   
  
  model  <- broom::tidy(aov(Value ~ Age.Group, data=clean_unemployment))
  model
  age_aov_p <-  model$p.value[1]
  age_aov_F <- model$statistic[1]
  age_aov_df  <- model$df
  

  # Write new CSV
  write.csv(model, out,row.names=FALSE)
}

# Call main function
main()


