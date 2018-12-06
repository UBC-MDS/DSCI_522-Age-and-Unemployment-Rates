# Docker file for DSCI_522-Age-and-Unemployment-Rates
# Simon Chiu
# Hayley Boyce
#Dec 6th, 2018

# Usage:
#   Building the docker image: docker build --tag age-and-unemployment-rates:0.1 .
#		Creating the report: docker run --rm -v PATH_ON_YOUR_COMPUTER:/Age-and-Unemployment-Rates age-and-unemployment-rates:0.1 make -C '/Age-and-Unemployment-Rates' all
#		Cleaning the report: docker run --rm -v PATH_ON_YOUR_COMPUTER:/Age-and-Unemployment-Rates age-and-unemployment-rates:0.1 make -C '/Age-and-Unemployment-Rates' clean

# use rocker/tidyverse as the base image
FROM rocker/tidyverse


