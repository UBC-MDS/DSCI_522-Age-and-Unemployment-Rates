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


# use ubuntu:latest as base image
FROM ubuntu:latest

# get OS updates and install build tools
RUN apt-get update
RUN apt-get install -y build-essential

# install graphviz
RUN apt-get install -y graphviz

# install git
RUN apt-get install -y wget
RUN apt-get install -y make git

# clone, build makefile2graph,
# then copy key makefile2graph files to usr/bin so they will be in $PATH
RUN git clone https://github.com/lindenb/makefile2graph.git

RUN make -C makefile2graph/.

RUN cp makefile2graph/makefile2graph usr/bin
RUN cp makefile2graph/make2graph usr/bin