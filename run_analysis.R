library(dplyr)

if(!file.exists("./data")){dir.create("./data")}

#### Downloading the UCI HAR Dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzipping the data
unzip(zipfile="./data/Dataset.zip",exdir="./data")


### Reading the training sets, test sets, subject files, features file and acitivity labels file into table format
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")


x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

features <- read.table('./data/UCI HAR Dataset/features.txt')

activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')


#### 1. Merges the training and the test sets to create one data set.
X_total <- rbind(x_train, x_test)
Y_total <- rbind(y_train, y_test)
Sub_total <- rbind(subject_train, subject_test)


#### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selected_var <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]

X_total <- X_total[,selected_var[,1]]


### 3. Uses descriptive activity names to name the activities in the data set
colnames(Y_total) <- "activity"

Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))

activitylabel <- Y_total[,-1]


### 4. Appropriately labels the data set with descriptive variable names.
colnames(X_total) <- features[selected_var[,1],2]


### 5. From the data set in step 4, creates a second, independent tidy data set with the average
#      of each variable for each activity and each subject.
colnames(Sub_total) <- "subject"

total <- cbind(X_total, activitylabel, Sub_total)

total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))

#storing the file into tidydata.txt
write.table(total_mean, file = "./data/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)