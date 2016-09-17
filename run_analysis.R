## This R script is to prepare tidy data that can be used for later analysis

## Read in names for features
activity_labels = read.delim("UCI HAR Dataset/activity_labels.txt", sep=" ", header=FALSE, as.is=TRUE)
features_lables = read.delim("UCI HAR Dataset/features.txt",        sep=" ", header=FALSE, as.is=TRUE)
names(activity_labels) = c("activityID","activityName");
names(features_lables) = c( "featureID", "featureName");

## Read in data
y_test        <- read.fwf( "UCI HAR Dataset/test/y_test.txt",         c(2) )
subject_test  <- read.fwf( "UCI HAR Dataset/test/subject_test.txt",   c(2) )
y_train       <- read.fwf( "UCI HAR Dataset/train/y_train.txt",       c(2) )
subject_train <- read.fwf( "UCI HAR Dataset/train/subject_train.txt", c(2) )

## Extracts only the measurements on the 
## mean and standard deviation for each measurement.
grepMeanStd = grepl("mean\\(\\)|std\\(\\)", features_lables$featureName )
colClasses = rep("NULL", 561);
colClasses[grepMeanStd] = "numeric";
x_test        <- read.fwf(   "UCI HAR Dataset/test/X_test.txt", rep(16, 561), colClasses=colClasses, buffersize=500 )
x_train       <- read.fwf( "UCI HAR Dataset/train/X_train.txt", rep(16, 561), colClasses=colClasses, buffersize=500 )
## x_test = readRDS("saved_rds/x_test.rds")
## x_train = readRDS("saved_rds/x_train.rds")

## Merges the training and the test sets to create one data set.
      x_merged = rbind(      x_train,       x_test)
      y_merged = rbind(      y_train,       y_test)
subject_merged = rbind(subject_train, subject_test)
   data_merged = cbind(subject_merged, y_merged, x_merged);

## Appropriately labels the data set with 
## descriptive variable names.
mean_std_labels = features_lables[grepMeanStd,"featureName"];
mean_std_labels = gsub("\\(\\)", "", mean_std_labels)
names(data_merged) = c("subject", "activity", mean_std_labels);

## Uses descriptive activity names to 
## name the activities in the data set
data_merged$activity = activity_labels[data_merged$activity, "activityName"]

## Creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject.
library(reshape2)
subject_activity = paste(data_merged[,"subject"], data_merged[,"activity"])
data_merged = cbind(data_merged, subject_activity)
melt_merged <- melt( data_merged, 
						  id="subject_activity", 
						  measure.vars=mean_std_labels )
result <- dcast(melt_merged, subject_activity ~ variable, mean)
splitID = colsplit(result$subject_activity, " ", c("subject", "activity"))
result = cbind(splitID, result[,-1])
result = result[order(result$subject, result$activity),]

write.table( result, file="result.txt", row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE )
# saveRDS(result, file = "result.rds")

## To Load Data
## result = readRDS("saved_rds/result.rds")
