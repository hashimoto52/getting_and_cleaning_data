
##Getting and Cleaning Data Course Project
##2017.06.14 Hashimoto Tomoko
##
##Here are the data for this project:
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
library(dplyr)
library(tidyr)

#0,downloads data
url_p <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(url_p,temp)
traindata <- read.table(unzip(temp, "UCI HAR Dataset/train/X_train.txt"))
trainlabel <- read.table(unzip(temp, "UCI HAR Dataset/train/y_train.txt"))
testdata <- read.table(unzip(temp, "UCI HAR Dataset/test/X_test.txt"))
testlabel <- read.table(unzip(temp, "UCI HAR Dataset/test/y_test.txt"))
featuresdata <- read.table(unzip(temp, "UCI HAR Dataset/features.txt"))
activity <- read.table(unzip(temp, "UCI HAR Dataset/activity_labels.txt"))
subject_test <- read.table(unzip(temp,"UCI HAR Dataset/test/subject_test.txt"))
subject_train <- read.table(unzip(temp,"UCI HAR Dataset/train/subject_train.txt"))
unlink(temp)
##
##

##1,Merges the training and the test sets to create one data set.
all_data <- rbind(traindata, testdata)#marges training data and test data
all_subject <- rbind(subject_train,subject_test)#marges subjects
all_label <- rbind(trainlabel, testlabel) #marges labels

colnames(all_data) <- featuresdata[,2]           #changes col names of all_data to features description
colnames(all_subject) <- c("subject")
colnames(all_label) <- c("activity_no")

##2,Extracts only the measurements on the mean and standard deviation 
##  for each measurement.

subdata <- all_data[,grep("[Mm]ean()|[Ss]td()",featuresdata[,2])]


##3,Uses descriptive activity names to name the activities in the data set
colnames(activity) <- c("activity_no","activity")
activity_label <- inner_join(all_label,activity,by="activity_no")

##4,Appropriately labels the data set with descriptive variable names.
tidy1_1 <- cbind(activity=activity_label$activity,subject=all_subject,subdata)

##5,From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.
tidy1_2 <- gather(tidy1,feature,value,-activity,-subject)
tidy2 <- tidy2 %>% group_by(feature,activity,subject) %>% summarise(mean=mean(value))

