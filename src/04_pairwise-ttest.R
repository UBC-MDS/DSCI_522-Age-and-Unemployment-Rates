#! /usr/bin/env Rscript 
# 04_pairwise-ttest.R
# Hayley Boyce
# Simon Chiu
# November 22, 2018
#
# PURPOSE: This script takes the clean dataset in the data directory and performs 3 pairwise t-tests on the `Age.Group` values to see exactly
# which age groups differs from each other.
# 
# METHOD: This script takes 2 arguments: one taking the clean data (unemployment-age-gender-countries-filtered-clean.csv") file made fromm script 
# 01_clean-data.R and the other names the newly created pairwise t-test table with conclusions if we reject or fail to reject the null hypothesis.
# 
# USAGE: Rscript 04_pairwise-ttest.R
#

# RECOMMENDED:  bash Rscript src/04_pairwise-ttest.R  "data/unemployment-age-gender-countries-filtered-clean.csv" "results/pairwise-test-table.csv"

library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
out <- args[2]

# define main function
main <- function(){
  
  
  # read in data
  clean_unemployment <- read.csv(input_file)
  
 
  # Created a table for reporting the estimates and 
  clean_unemployment$Age.Group <- as.factor(clean_unemployment$Age.Group)
  
  
  # Calculated confidence intervals for report analysis using alpha= 0.05 and 2 tails. 
  
  rate_estimate <- clean_unemployment %>% 
    group_by(Age.Group) %>% 
    summarize(estimate = mean(Value), std_dev = sd(Value), n = n()) %>% 
    mutate(SE = sqrt((std_dev^2)/(n)), lower_ci = estimate - qnorm(0.05/2)*(SE),
           upper_ci = estimate + qnorm(0.05/2)*(SE))
  

  #the actual calculation of the test statistic and p-value using tidy and pairwise.t.test - Since we are using alternative ="two.sided" 
  #if the p > 0.05 then we fail to reject the null hypothesis that  The mean unemployment rates across the age groups are equal.
  
  pairwise_test <- broom::tidy(pairwise.t.test(x=clean_unemployment$Value, 
                                               g=clean_unemployment$Age.Group,
                                               p.adjust.method = "none", 
                                               alternative ="two.sided")) %>% 
    mutate (reject_H0 = if_else(p.value>0.05, FALSE, TRUE))
  

  #changed the column names 
  colnames(pairwise_test)[colnames(pairwise_test)=="group1"] <- "Age.group.1"
  colnames(pairwise_test)[colnames(pairwise_test)=="group2"] <- "Age.group.2"  
  
  # Write new CSV  
  write.csv(rate_estimate, "results/estimate-table.csv",row.names=FALSE)
  write.csv(pairwise_test, out,row.names=FALSE )
}
# call main function
main()

