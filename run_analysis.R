library(dplyr)
projectURL = "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(projectURL, destfile = "projectfiles.zip")
unzip("projectfiles.zip")
testfile1 =  read.table("UCI HAR Dataset/test/subject_test.txt")
testfile2 =  read.table("UCI HAR Dataset/test/X_test.txt")
testfile3 =  read.table("UCI HAR Dataset/test/y_test.txt")
trainfile3 =  read.table("UCI HAR Dataset/train/y_train.txt")
trainfile2 =  read.table("UCI HAR Dataset/train/X_train.txt")
trainfile1 =  read.table("UCI HAR Dataset/train/subject_train.txt")
testfile = data.frame(testfile1,testfile3,testfile2)
trainfile = data.frame(trainfile1,trainfile3,trainfile2)
mergedfile = rbind(testfile,trainfile)
headers = read.table("UCI HAR Dataset/features.txt")
grepl("mean()",headers[,2],fixed = T) -> headerswithmean
grepl("std()",headers[,2],fixed = T) -> headerswithstd
headerselected = c(T, T, headerswithmean | headerswithstd)
selectedfile = mergedfile[headerselected]
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
colnames(selectedfile)[2] <- "activities"
colnames(activity_labels) <- c("activities","activity")
merged_activity = merge(selectedfile,activity_labels)
rplcd_activity = merged_activity[-1]
c(headerswithmean | headerswithstd) -> headers_mean_or_sd
headers[headers_mean_or_sd,][2] -> names_for_col
colnames(rplcd_activity)[1:(ncol(rplcd_activity)-1)] = c("subject",as.character(names_for_col[,1]) )
group_by(rplcd_activity,subject,activity)->grouped_data
final_result = summarise_each(grouped_data,funs(mean))

