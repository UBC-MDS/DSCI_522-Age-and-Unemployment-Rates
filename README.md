
# DSCI_522 -  Age and Unemployment Rates

Contributers: 

CHIU, CHEUK MAN (github.com ID: [cheukman1207](https://github.com/cheukman1207) )

BOYCE, HAYLEY (github.com ID: [hfboyce](https://github.com/hfboyce) )

## Proposal:

The relationship between age and unemployment rates 


### Data set:

Dataset: [Employment: Unemployment rate by sex and age group](https://stats.oecd.org/index.aspx?queryid=54743) by OECD.org.   
Also can be found in the [data](https://github.com/UBC-MDS/DSCI_522-Age-and-Unemployment-Rates/tree/master/data) directory of this repository. 

### Loading the data: 

The script for loading the data can be found here: [scripts](https://github.com/UBC-MDS/DSCI_522-Age-and-Unemployment-Rates/tree/master/scripts)


[](https://github.com/hfboyce/DSCI_522-Gender-and-Age-World-Unemployment-Rates-/blob/master/img/load_data.png)


###  Question:


The exploratory question that we will attempt to answer in this analysis is:  
*"Is there a difference in unemployment rates of developed countries in different age groups?"*
 


### Plan of Action for the Analysis:

To conduct this analysis, we plan to look only at observations from developed countries in the past 10 years.  We plan to split the unemployment rates of developed countries into different age groups and see if there is a difference in mean unemployment rate between the age groups. 

We will be preforming an ANOVA test to test the difference among mean unemployment rates by studying the variation between age groups relative to the variation within the age group. (X = Age group, Y = Unemployment rate)
This will require the calculation of mean sums of squares and mean squares error which will be use in the calculation of a F statistic. 
 
To answer the hypothesis question "Is there a difference in unemployment rates of developed countries in different age groups?", we will be using the following null and alternate hypotheses.
  
Null hypothesis: The mean unemployment rates across all age groups are equal.     
Alternative hypothesis: The mean unemployment rates across all age groups are not equal.    


###  Summarize the Data: 

I expect to summarize our results using the ANOVA table as well as an addition explaining the outcomes. 
To help explain our conclusions, a violin plot with overlaying jitter should give a good idea on the quantity of data we have, the median and a confidence interval. 



