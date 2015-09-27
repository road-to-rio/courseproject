# this file will walk you through the run_analysis.R file

line 1: load the R package "dplyr", as the functions "group_by" and "summarise_each" will be used later

line 2 to 4: getting the raw data from the internet and unzip it into the wd, you may want to skip this part if these files are already in your wd

line 5 to 10: reading the required files into R

line 11 to 13: merge these files into 1 consolidated file

line 14: read the descriptive variable names into R

line 15 to 18: select only the variables describing means and standard deviations

line 19 to 23: replace the numbers with descriptive activity names in the data set

line 24 to 26: rename the column names with descriptive variable names

line 27 to 28: return the means for each activity and each subject using the "group_by" and "summarise_each" functions in R package "dplyr"
