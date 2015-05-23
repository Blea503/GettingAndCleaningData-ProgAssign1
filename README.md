# GettingAndCleaningData-ProgAssign1
Given the UCI HAR Dataset, create a tidy data set that calculates the means for the mean and std dev for each subject and activity.
This tidy dataset is used for later analysis.

## Steps
There is a run_analysis.R script that prepares the data in the following manner:
 1. Merges the training and the test sets to create one data set.
 1. Extracts only the measurements on the mean and standard deviation for each measurement. 
 1. Uses descriptive activity names to name the activities in the data set
 1. Appropriately labels the data set with descriptive variable names. 
 1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Outputs
The following artifacts exist:
* README.md - this file
* har_data_means.txt - final tidy dataset in write.table() format
* run_analysis.R - R code to prepare the data set
