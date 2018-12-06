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

