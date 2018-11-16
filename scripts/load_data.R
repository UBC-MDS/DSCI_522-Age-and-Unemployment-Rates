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
  data <- read.csv(url("https://raw.githubusercontent.com/UBC-MDS/DSCI_522-Age-and-Unemployment-Rates/master/data/unemployment-age-gender.csv"))
  head(data)
}

# call main function
main()
