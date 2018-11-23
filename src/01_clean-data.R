#! /usr/bin/env Rscript 
# 01_clean-data.R
# Hayley Boyce
# Simon Chiu
# November 22, 2018

# PURPOSE: This script takes the dataset in the data directory and will clean  and filter it. 
# 
# METHOD:  This script takes 2 arguments: one taking the raw data file name and the other assigning a name to the newly cleaned CSV
# 
# USAGE: Rscript 01_clean-data.R
#
# RECOMMENDED:  bash Rscript src/01_clean-data.R "data/unemployment-age-gender.csv" "data/unemployment-age-gender_countries_filtered_clean.csv"


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


# filters out developing  countries
excluding_countries = c("Brazil", "Russia", "Mexico", "India", "Indonesia", "South Africa", "Turkey", "OECD - Average", 
                        "China (People's Republic of)", "Colombia", "Costa Rica")

# cleaned toselect only the necessary columns and filtered out the 2 unnecessary age groups 
clean_unemployment <- data %>% select(COU, Country, Age.Group, Time, Sex, Value) %>%
  arrange(Country, Time, Age.Group) %>%
  filter( Age.Group == "15-24" | Age.Group=="25-54"| Age.Group=="55-64") %>%
  filter(!(Country %in% excluding_countries))

#Write new CSV
write.csv(clean_unemployment, out, row.names=FALSE)
}

# call main function
main()