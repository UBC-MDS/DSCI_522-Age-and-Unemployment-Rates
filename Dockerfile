# Docker file for DSCI_522-Age-and-Unemployment-Rates
# Hayley Boyce
## Simon Chiu
# Dec 4th 2018

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# then install the broom package
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    broom
