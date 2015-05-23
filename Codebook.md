---
title: "UHI HAR Data Codebook"
author: "Rick Wargo"
date: "5/22/2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
Utilizing data collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone, create a tidy dataset that can be used for further analysis. This tidy data set is the mean of the means and standard deviations features with the UCI (University of California, Irvine) HAR (Human Activity Recognition) Dataset.

##Study design and data processing
Data is processed to join the test and train datasets, selecting only means and standard deviations. Data is coordinated such that each observation is associated with the corresponding subject and activity.

###Collection of the raw data
Data is derived from the UCI HAR study and is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

###Notes on the original (raw) data 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

##Creating the tidy datafile
The tidy datafile, which is a composition of the test and train data, with factors for subjects and activities, has measures that represent the mean of the means and standard deviations in the original data set.

###Guide to create the tidy data file
 1. Prepare directory with data sets and code, if the data does not already exist. This data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
 2. Optionally, set the sample.rows configuration value to a small number (such as 10) for development purposes. Set to -1 for production/file submission.
 3. Execute run_analysis.R in the correct working directory.
 4. Output is the har_data_means.txt. This may take a few seconds to run.

###Cleaning of the data
 1. Convert the features to convential column names, removing special characters or replace with a period, and make time and frequency variables more obvious. Also separate camelCase variables to period-separated.
 2. Proper case activity labels for later use.
 3. Read in the testing and training data, combining the rows into one data set.
 4. Add the subject and activity factors as the beginning columns of the data set.
 5. Select only the features that are means or standard deviations. The Angle() calls, even though they specify a mean as an argument are not means. Also, the meanFreq() features represent frequency of means and not necessarily mean data points and should be excluded.
 6. For each unique combination of subject and activity, summarize the data by calculating the mean of the values
 7. Rename columns to indicate this is the mean of the column and not the actual value.
 8. Finally, write the data to a file using write.table(), for later use.

##Description of the variables in the har_data_means.txt file
 * The har_data_means.txt file contains 40 observations of 68 variables.
 * For each unique combination of subject and activity, the data is summarized by calculating the mean of each of the values
 The values are normalized and bounded within [-1,1].
 * The following variables are present in the dataset:
   - subject                                  
   - activity                                 
   - mean.of.time.body.acc.mean.x             
   - mean.of.time.body.acc.mean.y             
   - mean.of.time.body.acc.mean.z             
   - mean.of.time.body.acc.std.x              
   - mean.of.time.body.acc.std.y              
   - mean.of.time.body.acc.std.z              
   - mean.of.time.gravity.acc.mean.x          
   - mean.of.time.gravity.acc.mean.y          
   - mean.of.time.gravity.acc.mean.z          
   - mean.of.time.gravity.acc.std.x           
   - mean.of.time.gravity.acc.std.y           
   - mean.of.time.gravity.acc.std.z           
   - mean.of.time.body.acc.jerk.mean.x        
   - mean.of.time.body.acc.jerk.mean.y        
   - mean.of.time.body.acc.jerk.mean.z        
   - mean.of.time.body.acc.jerk.std.x         
   - mean.of.time.body.acc.jerk.std.y         
   - mean.of.time.body.acc.jerk.std.z         
   - mean.of.time.body.gyro.mean.x            
   - mean.of.time.body.gyro.mean.y            
   - mean.of.time.body.gyro.mean.z            
   - mean.of.time.body.gyro.std.x             
   - mean.of.time.body.gyro.std.y             
   - mean.of.time.body.gyro.std.z             
   - mean.of.time.body.gyro.jerk.mean.x       
   - mean.of.time.body.gyro.jerk.mean.y       
   - mean.of.time.body.gyro.jerk.mean.z       
   - mean.of.time.body.gyro.jerk.std.x        
   - mean.of.time.body.gyro.jerk.std.y        
   - mean.of.time.body.gyro.jerk.std.z        
   - mean.of.time.body.acc.mag.mean           
   - mean.of.time.body.acc.mag.std            
   - mean.of.time.gravity.acc.mag.mean        
   - mean.of.time.gravity.acc.mag.std         
   - mean.of.time.body.acc.jerk.mag.mean      
   - mean.of.time.body.acc.jerk.mag.std       
   - mean.of.time.body.gyro.mag.mean          
   - mean.of.time.body.gyro.mag.std           
   - mean.of.time.body.gyro.jerk.mag.mean     
   - mean.of.time.body.gyro.jerk.mag.std      
   - mean.of.freq.body.acc.mean.x             
   - mean.of.freq.body.acc.mean.y             
   - mean.of.freq.body.acc.mean.z             
   - mean.of.freq.body.acc.std.x              
   - mean.of.freq.body.acc.std.y              
   - mean.of.freq.body.acc.std.z              
   - mean.of.freq.body.acc.jerk.mean.x        
   - mean.of.freq.body.acc.jerk.mean.y        
   - mean.of.freq.body.acc.jerk.mean.z        
   - mean.of.freq.body.acc.jerk.std.x         
   - mean.of.freq.body.acc.jerk.std.y         
   - mean.of.freq.body.acc.jerk.std.z         
   - mean.of.freq.body.gyro.mean.x            
   - mean.of.freq.body.gyro.mean.y            
   - mean.of.freq.body.gyro.mean.z            
   - mean.of.freq.body.gyro.std.x             
   - mean.of.freq.body.gyro.std.y             
   - mean.of.freq.body.gyro.std.z             
   - mean.of.freq.body.acc.mag.mean           
   - mean.of.freq.body.acc.mag.std            
   - mean.of.freq.body.body.acc.jerk.mag.mean 
   - mean.of.freq.body.body.acc.jerk.mag.std  
   - mean.of.freq.body.body.gyro.mag.mean     
   - mean.of.freq.body.body.gyro.mag.std      
   - mean.of.freq.body.body.gyro.jerk.mag.mean
   - mean.of.freq.body.body.gyro.jerk.mag.std 

### Variable: subject                                  
 - Factor with 30 levels: 1..30
 - Each Factor represents an individual subject

### Variable: activity                                 
 - Factor with 6 levels:
   - Walking
   - Walking_Upstairs
   - Walking_Downstairs
   - Sitting
   - Standing

### Variable: mean.of.time.body.acc.mean.x             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.mean.y             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.mean.z             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.std.x              
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.std.y              
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.std.z              
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.gravity.acc.mean.x          
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.gravity.acc.mean.y          
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.gravity.acc.mean.z          
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.gravity.acc.std.x           
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.gravity.acc.std.y           
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.gravity.acc.std.z           
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.jerk.mean.x        
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.jerk.mean.y        
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.jerk.mean.z        
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.jerk.std.x         
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.jerk.std.y         
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.jerk.std.z         
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.mean.x            
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.mean.y            
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.mean.z            
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.std.x             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.std.y             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.std.z             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.jerk.mean.x       
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.jerk.mean.y       
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.jerk.mean.z       
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.jerk.std.x        
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.jerk.std.y        
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.jerk.std.z        
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.mag.mean           
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.mag.std            
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.gravity.acc.mag.mean        
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.gravity.acc.mag.std         
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.jerk.mag.mean      
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.acc.jerk.mag.std       
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.mag.mean          
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.mag.std           
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.jerk.mag.mean     
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.time.body.gyro.jerk.mag.std      
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.mean.x             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.mean.y             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.mean.z             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.std.x              
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.std.y              
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.std.z              
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.jerk.mean.x        
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.jerk.mean.y        
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.jerk.mean.z        
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.jerk.std.x         
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.jerk.std.y         
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.jerk.std.z         
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.gyro.mean.x            
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.gyro.mean.y            
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.gyro.mean.z            
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.gyro.std.x             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.gyro.std.y             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.gyro.std.z             
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.mag.mean           
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.acc.mag.std            
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.body.acc.jerk.mag.mean 
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.body.acc.jerk.mag.std  
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.body.gyro.mag.mean     
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.body.gyro.mag.std      
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.body.gyro.jerk.mag.mean
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name

### Variable: mean.of.freq.body.body.gyro.jerk.mag.std 
 - Mean of values for each subject for each activity. Values are normalized and bounded within [-1,1]
 - Description follows the variable name
