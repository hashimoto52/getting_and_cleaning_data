##Getting and Cleaning Data Course Project
##2017.05.13 Hashimoto Tomoko
##
##Here are the data for this project:
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
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
unlink(temp)
##
##

##1,Merges the training and the test sets to create one data set.
all_data <- rbind(traindata, testdata) #marges training data and test data
colnames(all_data) <- 1:561           #changes col names of all_data to feature number
all_label <- rbind(trainlabel, testlabel) #marges labels
one_data <- cbind(all_label,all_data)     #marges data and label 
colnames(one_data)[1] <- c("activity_no") #changes 1st col name to "activity_no"

one_data <- gather(one_data, feature_no, value, -activity_no) #changes all data to tidy data
one_data[,2] <- as.numeric(one_data[,2])          #changes feature_no value's class to number from chr

colnames(features) <- c("feature_no","features_method") #names col names of features data
new_one_data <- inner_join(one_data,features,by="feature_no") #marges features and one_data

##2,Extracts only the measurements on the mean and standard deviation 
##  for each measurement.

subset <- new_one_data[grep("[Mm]ean|[Ss]td",new_one_data$features_method),]


##3,Uses descriptive activity names to name the activities in the data set
colnames(activity) <- c("activity_no","activity")
newsub <- inner_join(subset,activity,by="activity_no")
##4,Appropriately labels the data set with descriptive variable names.
tidy1 <- newsub %>% select(features_method,activity,value)

##5,From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.
tidy2 <- tidy1 %>% group_by(features_method,activity) %>% summarise(mean=mean(value))
