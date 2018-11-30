# run_all.sh
# Hayley Boyce
# Simon Chiu
# November 26, 2018

# PURPOSE: This script will run all scripts and produce outputs needed for the final report.
#           This will also create a final markdown report.

# USAGE: bash run_all.sh



#1.The 01_clean-data.R  Rscript that outputs a clean data csv
Rscript src/01_clean-data.R data/unemployment-age-gender.csv data/unemployment-age-gender-countries-filtered-clean.csv

#2 The 02_visualize-data.R Rscript that outputs a 3 png files
Rscript src/02_visualize-data.R data/unemployment-age-gender-countries-filtered-clean.csv img/

#3 The 03_anova.R  Rscript that outputs an ANOVA csv
Rscript src/03_anova.R  data/unemployment-age-gender-countries-filtered-clean.csv results/anova-table.csv

#4 The 04_pairwise-ttest.R  Rscript that outputs an estimate-table csv  and  pairwise-test-table csv
Rscript src/04_pairwise-ttest.R  data/unemployment-age-gender-countries-filtered-clean.csv results/pairwise-test-table.csv

#5  Creates the md report
Rscript -e "rmarkdown::render('doc/age-and-unemployment-rates-report.Rmd')"
