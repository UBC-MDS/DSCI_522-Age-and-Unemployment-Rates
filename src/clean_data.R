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
data <- read.csv(input_file)
print(head(data))

# cleaned to combine Male and Female and filtered out the unnecessary columns
clean_unemployment <- data %>% select(COU, Country, Age.Group, Time, Sex, Value) %>%
  group_by(Country, Time, Age.Group) %>%
  spread (Sex, Value) %>% 
  arrange(Country, Time, Age.Group) %>%
  mutate(unemployment_rate = sum(Women, Men)) %>%
  filter( Age.Group == "15-24" | Age.Group=="25-54"| Age.Group=="55-64")


#Write new CSV
write.csv(clean_unemployment, out)
}

# call main function
main()