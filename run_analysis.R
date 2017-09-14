run_analysis.r <- function(){
        setwd("~/UCI HAR Dataset")
        library(data.table)   ##----------- loads the required packages need to 
        library(plyr)           ##----------- run the analysis
        library(dplyr)
##reads all files into data.table format with specified column classes
        train_x <- fread("train/X_train.txt", nrows = 7352)
        train_subject <- fread("train/subject_train.txt", col.names = 
                                       c("subject"), colClasses = c("numeric"))
        train_activity <- fread("train/y_train.txt", col.names = c("activity"), 
                                colClasses = c("numeric"))
        traindt <- data.table(train_subject, train_activity, train_x)
        test_x <- fread("test/X_test.txt", nrows=2947)
        test_subject <- fread("test/subject_test.txt", col.names=c("subject"), 
                              colClasses = c("numeric"))
        test_activity <- fread("test/y_test.txt", col.names=c("activity"), 
                               colClasses = c("numeric"))
        features <- fread("features.txt", nrows = 561, col.names = 
                                  c("number", "name"))
        testdt <- data.table(test_subject, test_activity, test_x)
##merge train and test datasetsand sets the features as variable names
        DT <- bind_rows(traindt,testdt) 
        names(DT) <- c("subject" , "activity", t(features$name))
##subset features with mean and std and recode activity #'s with correct names
        library(stringr)
        chv <- str_subset(names(DT), "subject|activity|mean|std")
        dt2 <- DT[, .SD, .SDcols= chv]
        dt2$activity <- recode(dt2$activity, '1'="walking", 
                               '2'="walking upstairs", '3'="walking downstairs",
                               '4'="sitting",'5'="standing",'6'="laying")
        write.table(dt2, file = "tidydata.txt", row.names = FALSE)
### Create a second, independent tidy data set with the average of each variable 
##for each activity and each subject.
        dt3 <- dt2[,lapply(.SD, mean), by="subject,activity"]
        names(dt3) <- names(dt3) %>% 
                str_replace_all(c("^t{1}"="time domain ","^f{1}"="frequency domain ", 
                                "Acc"=" acceleration","Gyro"="angular speed",
                                "GyroJerk"=" angular acceleration", 
                                "Gravity"="gravity ", "BodyBody"="body"))
        
        setwd("~/")}