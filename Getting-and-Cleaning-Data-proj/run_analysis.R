# script for course project of the Coursera Getting and Cleaning Data course

# NOTE: It's assumed that the "UCI HAR DATASET/" exists in the working directory
# TODO: Figure out if it's necessary to test for Linux vs Windows directory structure
# TODO: Check that the directory exists in the working directory

# Load any necessary libraries
library(dplyr)

# Load in activity_labels.txt and features.txt
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
feature_labels <- read.table("UCI HAR Dataset/features.txt")

# Load in the X_train.txt, subject_train.txt, and y_train.txt files
# from the UCI HAR Dataset/train/ directory
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Mess with the column names
names(train_data) <- make.names(feature_labels[,2], unique=TRUE)
names(train_activity) <- c("ActivityID")
names(train_subject) <- c("SubjectID")

# Combine the train data into a single data frame
train_df <- cbind(train_subject, train_activity, train_data)

# Load in the X_test.txt, subject_test.txt, and y_test.txt files from
# from the UCI HAR Dataset/text/ directory
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Mess with the column names
# NOTE: this probably isn't necessary, since we're going to rbind
#       with the train data set configured above
names(test_data) <- make.names(feature_labels[,2], unique=TRUE)
names(test_activity) <- c("ActivityID")
names(test_subject) <- c("SubjectID")

# Combine the test data into a single data frame
test_df <- cbind(test_subject, test_activity, test_data)

# Combine the train and test data into a single data frame
all_data <- rbind(train_df, test_df)

# Select only the mean() and std() for each measurement
# Since we've used make.names() it turns "-mean()" -> ".mean.." and "-std()" -> ".std.."
# Make sure to keep the 2 ID columns
sel_data <- select(all_data, contains("ID"), contains(".mean.."), contains(".std.."))

# Get rid of extra ".." in column names
names(sel_data) <- gsub("..", "", names(sel_data), fixed=TRUE)

# Make a tidy data set with the means of each measurement
# for each activity and subject
mean_data <- ddply(sel_data, .(SubjectID, ActivityID), sapply, mean)

# Turn ActivityID into a factor with labels
sel_data$ActivityID <- factor(sel_data$ActivityID, 
                              levels=activity_labels[, 1], 
                              labels=activity_labels[, 2])

mean_data$ActivityID <- factor(mean_data$ActivityID,
                               levels=activity_labels[, 1],
                               labels=activity_labels[, 2])

# Rename ActivityID -> Activity
names(sel_data)[2] <- "Activity"
names(mean_data)[2] <- "Activity"

# Remove all unnecessary variables
rm(activity_labels, feature_labels)
rm(test_data, test_activity, test_subject, test_df)
rm(train_data, train_activity, train_subject, train_df)
rm(all_data)