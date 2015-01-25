# Course Project for Getting and Cleaning Data on Coursera

## Project Outline

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to use run_analysis.R

To obtain the the tidy data sets, follow these steps:

1. Download the UCI HAR Dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Run `source("run_analysis.R")`
3. Run `clean_UCI_HAR_dataset()`. If the unzipped data from step 1 is not present in your working data, pass the full path to the directory to the function. This is the only possible input pararameter.
4. The function returns a list containing two data frames labeled "FullData" and "SummaryData" in that order.

## Description of output data frames

Please see [CodeBook.md](CodeBook.md) for a description of the data frames output by `clean_UCI_HAR_dataset()`.

## Reading in the tidy data containing the mean of each variable for each subject and activity

The tidy data set uploaded for the project can be read into R using:


## Notes on decisions made for the project

Many of the decisions I made in how to execute this project were geared towards maintaining continuity between the input data set we were given and the cleaned and summarized output.

In executing step 2 "Extracts only the measurements on the mean and standard deviation for each measurement", I chose to only include variables where the mean() and std() were taken, according to `features_info.txt`. Therefore, I have not included variables using `meanFreq()` or any of those used in the `angle()` variables (gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean). In the absense of any further input from the "client", I thought this would be a cleaner and clearer process.

In executing step 3 "Uses descriptive activity names to name the activities in the data set", I have chosen to use the activity labels directly from `activity_labels.txt`. Again, I decided that this provided continuity between the data sets, and I found nothing lacking in the descriptiveness of the labels as given.

In executing step 4 "Appropriately labels the data set with descriptive variable names", I have again tried to maintain continuity between the data sets. I have chosen to use the labels (almost) as given in `features.txt`. To conform to standards required for `select()`, I have replaced all `-` with `.` and removed the `()`. I think this maintains a balance between concise and descriptive column names. For instance, the leading "t" denotes time while the leading "f" denotes frequency, as described in `features_info.txt`. 

When naming the columns of the tidy data set produced in step 5, I have again chosen to maintain internal consistency. Here, the only change made to the column names is to pre-pend "mean." to each of the columns of the full data set from step 4. The 2 exceptions are "SubjectID" and "Activity" which remain unchanged from the previous data table.

In the [CodeBook.md](CodeBook.md), I did not include any units on the measurement since I could not find any documentation in the original data and did not want to speculate.


