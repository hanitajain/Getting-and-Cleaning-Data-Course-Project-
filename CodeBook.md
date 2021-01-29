# Getting and Cleaning Data - Assignment week 4

## The tasks performed by transforming the data were:
1. Merging the training and test sets into one dataset.
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labelling the data set with descriptive variable names. 
5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.

## About the script file "run_analysis.R"

- The R-script file contains the code to get and clean the data from the UCI HAR Dataset repository by intially downloading it from the given URL and unzipping the files.

- We read the individual files of x_train, y_train, x_test, y_test, subject_train, subject_test, features and activity_labels in the table format, followed by the tasks mentioned above.

## Description of the tidy data set obtained

- The obtained tidy dataset has 180 rows and 68 columns. 

- Each row having averaged variables for each subject as well as for each activity.

- Only all the variables estimated from mean and standard deviation in the tidy set were kept.

## The activities were labelled as:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

