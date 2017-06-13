# Codebook

## Data
Here are the data for this project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Procedure
run_analysis.R contains following procedure.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. -> "tidy1_1" in the script
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. -> "tidy2" in the script

## Variables
- Data for this assignment is motion data (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) captureed by smartphone (Samsung Galaxy S II) on the waist of volunteers of the experiments. 

- In this assignment, I am using  88variables in the dataset "tidy1_1".
1. activity : 6 activity's description used in original data (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
2. subject : subject's description used in original data
3. columns from 3rd to 88th : extracted feature's description from original data (procedure 3) 

- And also using 4 variables in the dataset "tidy1_1" and "tidy2".
1. feature : features's description used in original data (same as "tidy1")
2. activity : 6 activity's description used in original data (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)(same as "tidy1_1")
3. subject : subject's description used in original data

4. (in "tidy1_1") value : measured value.
4. (in "tidy2") mean : mean value of "value" in "tidy1_1" ,for each feature, activity and subject.

- You can see the original description of variables in the txt files in the zip file above.  

### Reference 
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names

### Souce 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

### data download date
 2017/06/14
