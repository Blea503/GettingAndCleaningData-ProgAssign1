# GettingAndCleaningData-ProgAssign1
Given the UCI HAR Dataset, create a tidy data set that calculates the means for the mean and std dev for each subject and activity.
This tidy dataset is used for later analysis.

## Objective Steps
There is a run_analysis.R script that prepares the data in the following manner:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Inputs
 * Download and extract the files from the zip file [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip].

## Outputs
The following artifacts exist:
 * README.md - this file
 * har_data_means.txt - final tidy dataset in write.table() format
 * run_analysis.R - R code to prepare the data set

## Configuration
There is one config option available.
 * sample.rows - set to 10 while developing to have speedy execution; set to -1 to read entire datasets

## Approach
 1. Convert the features to convential column names, removing special characters or replace with a period, and make time and frequency variables more obvious. Also separate camelCase variables to period-separated.
 2. Proper case activity labels for later use.
 3. Read in the testing and training data, combining the rows into one data set.
 4. Add the subject and activity factors as the beginning columns of the data set.
 5. Select only the features that are means or standard deviations. The Angle() calls, even though they specify a mean as an argument are not means. Also, the meanFreq() features represent frequency of means and not necessarily mean data points and should be excluded.
 6. For each unique combination of subject and activity, summarize the data by calculating the mean of the values
 7. Rename columns to indicate this is the mean of the column and not the actual value.
 8. Finally, write the data to a file using write.table(), for later use.

## Steps
 1. Prepare directory with data sets and code, if the data does not already exist.
 2. Optionally, set the sample.rows configuration value to a small number (such as 10) for development purposes.
 3. Execute run_analysis.R in the correct working directory.
 4. Output is the har_data_means.txt. This may take a few seconds to run.
