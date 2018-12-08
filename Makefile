#! /usr/bin/env Rscript
# Hayley Boyce
# Simon Chiu
# November 27, 2018
#
# PURPOSE: This script takes all the scripts and creates a markdown report on the analysis.
#
# METHOD:  This script takes no arguments
#
# USAGE: make all
#	make clean


all: doc/age-and-unemployment-rates-report.md 

#1.The 01_clean-data.R  Rscript that outputs a clean data csv
data/unemployment-age-gender-countries-filtered-clean.csv: data/unemployment-age-gender.csv src/01_clean-data.R
	Rscript src/01_clean-data.R data/unemployment-age-gender.csv data/unemployment-age-gender-countries-filtered-clean.csv

#2 The 02_visualize-data.R Rscript that outputs a 3 png files
img/mean-CI.png img/histrogram.png img/violin.png: data/unemployment-age-gender-countries-filtered-clean.csv src/02_visualize-data.R
	Rscript src/02_visualize-data.R data/unemployment-age-gender-countries-filtered-clean.csv img/

#3 The 03_anova.R  Rscript that outputs an ANOVA csv
results/anova-table.csv: data/unemployment-age-gender-countries-filtered-clean.csv src/03_anova.R
	Rscript src/03_anova.R  data/unemployment-age-gender-countries-filtered-clean.csv results/anova-table.csv

#4 The 04_pairwise-ttest.R  Rscript that outputs an results/confidence-interval-estimate-table csv  and  pairwise-test-table csv
results/confidence-interval-estimate-table.csv results/pairwise-test-table.csv: data/unemployment-age-gender-countries-filtered-clean.csv src/04_pairwise-ttest.R
	Rscript src/04_pairwise-ttest.R  data/unemployment-age-gender-countries-filtered-clean.csv results/pairwise-test-table.csv

#5  Creates the md report
doc/age-and-unemployment-rates-report.md: doc/age-and-unemployment-rates-report.Rmd data/unemployment-age-gender-countries-filtered-clean.csv img/mean-CI.png img/histrogram.png img/violin.png results/anova-table.csv results/pairwise-test-table.csv
	Rscript -e "rmarkdown::render('doc/age-and-unemployment-rates-report.Rmd')"

clean:
	rm -f data/unemployment-age-gender-countries-filtered-clean.csv
	rm -f img/mean-CI.png
	rm -f img/histrogram.png
	rm -f img/violin.png
	rm -f results/anova-table.csv
	rm -f results/confidence-interval-estimate-table.csv
	rm -f results/pairwise-test-table.csv
	rm -f doc/age-and-unemployment-rates-report.html
