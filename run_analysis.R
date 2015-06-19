# File:   run_analysis.R
# Date:   2015-06-19
# Author: Rick Wargo
#
# Description
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.
#
# Modification History
# RCW  2015-06-19  New today

library(dplyr)

# set sample.rows to a small number to test, -1 to read in the full data set
sample.rows = -1

features <- read.table('UCI HAR Dataset/features.txt', header=FALSE, stringsAsFactors=FALSE)$V2

# generate descriptive variable names for each of the 561 features
# parens are removed, words separated, and commas replaced with .by.'
# all in lowercase
# read the following substitutions as taking place from the bottom up so the last to be performed is the tolower() call.
colnames <- tolower(                      # lowercase resulting variable name
  gsub('([a-z])([0-9A-Z])', '\\1.\\2',    # separate words with periods (camelCase)
  gsub('fGravity', 'freq.Gravity',        # expand f to signify frequency
  gsub('tGravity', 'time.Gravity',        # expand t to signify time
  gsub('fBody', 'freq.Body',              # expand f to signify frequency
  gsub('tBody', 'time.Body',              # expand t to signify time
  gsub('\\)', '',                         # ignore right parens
  gsub('\\(', '.of.',                     # left parens are replaced by .of.
  gsub(',', '.by.',                       # commas in function calls are replaced with .by.
  gsub('-', '.',                          # turn hyphens into periods
  gsub('\\(\\)', '',                      # remove empty calls ()
  features)))))))))))

# read in the activity labels, converting from UPPER_CASE to Proper_Case.
activity.labels <- read.table('UCI HAR Dataset/activity_labels.txt', header=FALSE, stringsAsFactors=FALSE)
activity.labels <- lapply(activity.labels, function(v) {
                        if (is.character(v)) 
                          return(gsub('((^[a-z])|_([a-z]))', 
                                      '\\U\\1', 
                                      tolower(v),
                                      perl=T)) 
                        else 
                          return(v) 
                        })
activity.labels <- data.frame(activity.labels)

# read in training and testing data features
train.data <- read.table('UCI HAR Dataset/train/X_train.txt', header=FALSE, nrows=sample.rows)
test.data <- read.table('UCI HAR Dataset/test/X_test.txt', header=FALSE, nrows=sample.rows)

# read in the subject and activity for each of the test data sets
test.subject.data <- read.table('UCI HAR Dataset/test/subject_test.txt', header=FALSE, colClasses=c('factor'), nrows=sample.rows)
test.activity.data <- read.table('UCI HAR Dataset/test/y_test.txt', header=FALSE, nrows=sample.rows)

# read in the subject and activity for each of the train data sets
train.subject.data <- read.table('UCI HAR Dataset/train/subject_train.txt', header=FALSE, colClasses=c('factor'), nrows=sample.rows)
train.activity.data <- read.table('UCI HAR Dataset/train/y_train.txt', header=FALSE, nrows=sample.rows)

# prepend the subject and activity to the test and train data sets
# beware of merge - the order is not kept so results are incorrect. need to use dplyr's inner_join instead (preserves order)
test.data$subject <- test.subject.data$V1
test.data$activity <- as.factor(inner_join(test.activity.data, activity.labels, by='V1')$V2)
train.data$subject <- train.subject.data$V1
train.data$activity <- as.factor(inner_join(train.activity.data, activity.labels, by='V1')$V2)

# merge the train and test data sets, including subject and activity
har.data = rbind(train.data, test.data)

# give the columns descriptive names
names(har.data) <- c(colnames, 'subject', 'activity')

# function to easily move columns to the beginning of the data frame
move_to_start <- function(x, to_move) {
  x[, c(to_move, setdiff(colnames(x), to_move))]
} 

# move subject and activity from the end of the dataset to the beginning
har.data <- move_to_start(har.data, c('subject', 'activity'))

# extract columns that are only mean or std devs
# the angle features, even though they accept mean as args, are not means, thus only features that begin with time or freq are required
# meanFreq() is not a mean, it is the frequency of the mean in the data and should be excluded from the features.group_by(dataset, subject, activity) %>% summarise_each(funs(mean))
har.mean.and.std.data <- har.data[, grep('^subject$|^activity$|(^(time|freq)\\..+\\.(mean|std)(?!\\.freq))', names(har.data), perl=TRUE)]

# for each unique combination of subject and activity, summarize the data by calculating the mean of the value (step 5)
har.mean.and.std.data.means <- har.mean.and.std.data %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# reset column names to represent mean of each feature
names(har.mean.and.std.data.means) <- gsub('^(time|freq)\\.', 'mean.of.\\1\\.', names(har.mean.and.std.data.means))

# save the resulting table
write.table(har.mean.and.std.data.means, 'har_data_means.txt', row.names=FALSE)
