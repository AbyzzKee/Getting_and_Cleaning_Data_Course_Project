# README.md

This file explains how all of the scripts in this repo
work and how they are connected.

"run_analysis.R" is the R script to
prepare tidy data that can be used for later analysis

"CodeBook.md" is the code book that describes 
the variables, the data, and transformations 
perform in "run_analysis.R"

With data set folder "UCI HAR Dataset" place in working directory
A second, independent tidy data set with the 
average of each variable for each activity and each subject
can be created by executing "run_analysis.R"

"reshape2" library is used in this project
if it is not installed please run:

      install.packages("reshape2")

to install it.