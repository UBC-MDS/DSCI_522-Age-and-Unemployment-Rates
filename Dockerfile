# Docker file for DSCI_522-Age-and-Unemployment-Rates
# Simon Chiu
# Hayley Boyce
#Dec 6th, 2018

# Usage:
#   Pulling the docker image from DockerHub: docker pull hfboyce/dsci_522-age-and-unemployment-rates
#		Creating the report: docker run --rm -v PATH_ON_YOUR_COMPUTER:/Age-and-Unemployment-Rates hfboyce/dsci_522-age-and-unemployment-rates:latest make -C '/Age-and-Unemployment-Rates' all
#		Cleaning the report: docker run --rm -v PATH_ON_YOUR_COMPUTER:/Age-and-Unemployment-Rates hfboyce/dsci_522-age-and-unemployment-rates:latest make -C '/Age-and-Unemployment-Rates' clean

# use rocker/tidyverse as the base image
FROM rocker/tidyverse


