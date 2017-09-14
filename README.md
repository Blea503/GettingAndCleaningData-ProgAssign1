Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

1. sets the working directory to where the downloaded files are located
2. loads the required packages need to run the analysis
3. reads all files into data.table format with specified column classes
4. merges the training and test datasets and assigns the features to the variable names
5. makes a new data.table that subsets the feature names containing "mean" and "std" 
6. recodes the the activity number with the corresponding names
7. writes and saves a text file of the subsetted data.table
8. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair
9. resets the working directory back to the pre-analysis location

