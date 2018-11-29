#! /usr/bin/env Rscript
# 01_clean-data.R
# Hayley Boyce
# Simon Chiu
# November 27, 2018

all: doc/age-and-unemployment-rates-report.md

#The clean-data script that
data/unemployment-age-gender-countries-filtered-clean.csv: data/unemployment-age-gender.csv src/01_clean-data.R
	Rscript src/01_clean-data.R data/unemployment-age-gender.csv data/unemployment-age-gender-countries-filtered-clean.csv

img/mean_CI.png img/histrogram.png img/violin.png: data/unemployment-age-gender-countries-filtered-clean.csv src/02_visualize-data.R
	Rscript src/02_visualize-data.R data/unemployment-age-gender-countries-filtered-clean.csv img/


results/anova-table.csv: data/unemployment-age-gender-countries-filtered-clean.csv src/03_anova.R
	Rscript src/03_anova.R  data/unemployment-age-gender-countries-filtered-clean.csv results/anova-table.csv

results/estimate-table.csv results/pairwise-test-table.csv: data/unemployment-age-gender-countries-filtered-clean.csv src/04_pairwise-ttest.R
	Rscript src/04_pairwise-ttest.R  data/unemployment-age-gender-countries-filtered-clean.csv results/pairwise-test-table.csv

doc/age-and-unemployment-rates-report.md: doc/age-and-unemployment-rates-report.Rmd data/unemployment-age-gender-countries-filtered-clean.csv img/mean_CI.png img/histrogram.png img/violin.png results/anova-table.csv results/pairwise-test-table.csv
	Rscript -e "rmarkdown::render('doc/age-and-unemployment-rates-report.Rmd')"



clean:
	rm -f data/unemployment-age-gender-countries-filtered-clean.csv
	rm -f img/mean_CI.png
	rm -f img/histrogram.png
	rm -f img/violin.png
	rm -f results/anova-table.csv
	rm -f results/estimate-table.csv
	rm -f results/pairwise-test-table.csv
	rm -f doc/age-and-unemployment-rates-report.html
