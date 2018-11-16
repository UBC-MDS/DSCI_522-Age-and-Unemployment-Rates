#! /usr/bin/env Rscript 
# load_data.R
# Simon Chiu, Nov 2018
#
# This script takes the dataset in the data directory and load it into the environment. This script takes no arguments.
#
# Usage: Rscript load_data.R

# define main function
main <- function(){
  
  # read in data
  data <- read.csv('data/GENDER_EMP_15112018225706733.csv')
  
}

# call main function
main()